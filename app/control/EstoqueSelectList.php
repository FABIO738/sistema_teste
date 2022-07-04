<?php
class EstoqueSelectList extends TPage
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
        $this->form->setFormTitle('Pesquisar produtos');
        
        $nome = new TEntry('nome');
        $this->form->addFields( [new TLabel('Descrição')], [$nome] );
        
        $this->form->addAction('Pesquisar', new TAction( [$this, 'onSearch']), 'fa:search');
   
        
        $this->form->setData( TSession::getValue( __CLASS__ . '_filter_data') );
        
        
        
        $this->datagrid = new BootstrapDatagridWrapper(new TDataGrid);
        $this->datagrid->style = 'width:100%';
        
        $col_id   = new TDataGridColumn('id','Código', 'left');
        $col_nome = new TDataGridColumn('nome', 'Descrição', 'left');
        $col_quantidade = new TDataGridColumn('quantidade', 'Quantidade', 'center');
        
        
        $this->datagrid->addColumn($col_id);
        $this->datagrid->addColumn($col_nome);
        $this->datagrid->addColumn($col_quantidade);
        
        
        //$col_id->setTransformer( [$this, 'formatRow'] );
        
        //$action = new TDataGridAction([$this, 'onSelect'], ['id' => '{id}'], ['register_state' => 'false'] );
       // $this->datagrid->addAction($action, 'Selecionar', 'far:square fa-fw black');
        
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
    
   /* public function onSelect($param)
    {
        $selecao = TSession::getValue(__CLASS__.'_selecao');
        
        try
        {
            TTransaction::open('curso');
            
            $produto = new Produto( $param['id'] );
            
            if (isset( $selecao[ $produto->id ]))
            {
                unset( $selecao[ $produto->id ] );
            }
            else
            {
                $selecao[ $produto->id ] = $produto->toArray();
            }
            
            TSession::setValue(__CLASS__.'_selecao', $selecao);
            
            TTransaction::close();
            
            $this->onReload($param);
        }
        catch (Exception $e)
        {
            new TMessage('error', $e->getMessage());
        }
    }
    */
    public function formatRow($id, $object, $row)
    {
        $selecao = TSession::getValue(__CLASS__.'_selecao');
        
        if ($selecao)
        {
            if (in_array( (int) $id, array_keys($selecao)))
            {
                $row->style = 'background: #abdef9';
                
                $button = $row->find('i', ['class'=>'far fa-square fa-fw black'])[0];
                
                if ($button)
                {
                    $button->class = 'far fa-check-square fa-fw black';
                }
            }
        }
        
        return $id;
    }
    
    public function onShow($param)
    {
        $selecao = TSession::getValue(__CLASS__.'_selecao');
        
        ksort($selecao);
        
        echo '<pre>';
        print_r ( $selecao);
        echo '</pre>';
    }
}
