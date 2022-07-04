<?php

class EstoqueEditList extends TPage
{
    private $form;
    private $datagrid;
    private $pageNavigation;
    
    use Adianti\Base\AdiantiStandardListTrait;
    
    public function __construct()
    {
        parent::__construct();
        
        $this->setDatabase('curso');
        $this->setActiveRecord('Estoque');
        $this->setDefaultOrder('id', 'asc');
        $this->addFilterField('nome', 'like', 'nome');   
        
        
        $this->form = new BootstrapFormBuilder('form_busca_produto');
        $this->form->setFormTitle('Buscar produtos');
        
        $nome = new TEntry('nome');
        $this->form->addFields( [new TLabel('Descrição')], [$nome] );
        
        $this->form->addAction('Buscar', new TAction( [$this, 'onSearch']), 'fa:search');
        
        $this->form->setData( TSession::getValue( __CLASS__ . '_filter_data') );
        
        
        
        $this->datagrid = new BootstrapDatagridWrapper(new TDataGrid);
        $this->datagrid->style = 'width:100%';
        
        $col_id   = new TDataGridColumn('id','Código', 'left');
        $col_nome = new TDataGridColumn('nome', 'Descrição', 'left');
        $col_quantidade = new TDataGridColumn('quantidade', 'Quantidade', 'center');
        //$col_estoque = new TDataGridColumn('estoque', 'Estoque', 'right');
        //$col_preco   = new TDataGridColumn('preco_venda', 'Preço', 'right');
        
        $col_quantidade->setTransformer( function($quantidade, $object, $row) {
            $widget = new TEntry('quantidade_' . $object->id);
            
            //$widget->setNumericMask(2, ',', '.', true);
            $widget->setValue( $quantidade );
            $widget->setSize(70);
            $widget->setFormName('form_busca_produto');
            
            $widget->setExitAction( new TAction( [$this, 'onSaveInline'], ['column' => 'quantidade']));
            
            return $widget;
       });
        
        $this->datagrid->addColumn($col_id);
        $this->datagrid->addColumn($col_nome);
        $this->datagrid->addColumn($col_quantidade);
        
        
        $this->datagrid->createModel();

        $this->pageNavigation = new TPageNavigation;
        $this->pageNavigation->setAction( new TAction([$this, 'onReload']) );
        
        $panel = new TPanelGroup;
        $panel->add($this->datagrid);
        $panel->addFooter($this->pageNavigation);
        
        $vbox = new TVBox;
        $vbox->style = 'width:100%';
        $vbox->add($this->form);
        $vbox->add($panel);
        
        parent::add( $vbox );
    }
    
    public static function onSaveInline($param)
    {
        $coluna = $param['column'];               // quantidade
        $nome   = $param['_field_name'];               // quantidade_1
        $valor  = $param['_field_value'];              // valor novo do campo
        
        $partes = explode( '_', $nome);
        $id     = end($partes);
        
        try
        {
            TTransaction::open('curso');
            
            $estoque = Estoque::find( $id );
            if ($estoque)
            {
                $estoque->$coluna = str_replace( ['.', ','], ['', '.'], $valor);
                $estoque->store();
            }
            
            TTransaction::close();
            
            TToast::show('success', '<b>'  . '</b> atualizado com sucesso', 'bottom center', 'far:check-circle');
        }
        catch (Exception $e)
        {
            TToast::show('error', $e->getMessage(), 'bottom center', 'fa:exclamation-triangle');
        }
    }
  
}
