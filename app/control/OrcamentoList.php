<?php
class OrcamentoList extends TPage
{
    private $form;                                //declarar formulario
    private $datagrid;
    private $pageNavigation;
    
    use Adianti\Base\AdiantiStandardListTrait;                  // importando classes do trait
    
    public function __construct()
    {
        parent::__construct();
        
        $this->setDatabase('curso');                            // nome do banco
        $this->setActiveRecord('Orcamento');                          //classe Orcamento.php para carregar os dados do banco
        $this->addFilterField('id', '=', 'id');                                  
        $this->addFilterField('dt_orcamento', '>=', 'data_de');
        $this->addFilterField('dt_orcamento', '<=', 'data_ate');
        $this->addFilterField('cliente_id', '=', 'cliente_id');
        $this->setDefaultOrder('dt_orcamento', 'asc');                                         //ordem de exibição
        
        $this->form = new BootstrapFormBuilder;
        $this->form->setFormTitle('Orçamentos');
        
        
        $id = new TEntry('id');
        $data_de = new TDate('data_de');
        $data_ate = new TDate('data_ate');
        
        $cliente_id = new TDBUniqueSearch('cliente_id', 'curso', 'Cliente', 'id', 'nome');
        $cliente_id->setMinLength(1);
        
        $this->form->addFields( [new TLabel('Id')], [$id] );
        $this->form->addFields( [new TLabel('Data inicial')], [$data_de], [new TLabel('Data final')], [$data_ate] );
        $this->form->addFields( [new TLabel('Cliente')], [$cliente_id] );
        
        
        $id->setSize('50%');
        $data_de->setSize('100%');
        $data_ate->setSize('100%');
        $data_de->setMask('dd/mm/yyyy');
        $data_ate->setMask('dd/mm/yyyy');
        //$data_de->setDatabaseMask('yyyy-mm-dd');
       // $data_ate->setDatabaseMask('yyyy-mm-dd');
        
        //$this->form->setData( TSession::getValue(__CLASS__ . '_filter_data') );
        
        $this->form->addAction( 'Buscar', new TAction([$this, 'onSearch']), 'fa:search');
        $this->form->addActionLink( 'Novo', new TAction(['OrcamentoForm', 'onEdit']), 'fa:plus green');



        $this->datagrid = new BootstrapDatagridWrapper(new TDataGrid);
        $this->datagrid->width = '100%';
        
        $col_id      = new TDataGridColumn('id', 'Código', 'center', '10%');
        $col_data    = new TDataGridColumn('dt_orcamento', 'Data', 'center', '20%');
        $col_cliente = new TDataGridColumn('cliente->nome', 'Cliente', 'left', '50%');
        $col_total   = new TDataGridColumn('total', 'Total', 'right', '20%');
        
        $col_total->setTransformer( function($total, $object, $row) {
            if (is_numeric($total))
            {
                return 'R$ ' . number_format($total, 2, ',', '.');
            } 
            return $total;
        });
        
       /* $col_data->setTransformer( function($data, $object, $row) {
            $date = new DateTime($data);
               return $date->format('d/m/Y');
     });*/
        
        $col_id->setAction( new TAction([$this, 'onReload']), ['order' => 'id']);
        $col_data->setAction( new TAction([$this, 'onReload']), ['order' => 'dt_orcamento']);
        
        $this->datagrid->addColumn( $col_id );
        $this->datagrid->addColumn( $col_data );
        $this->datagrid->addColumn( $col_cliente );
        $this->datagrid->addColumn( $col_total );
        
        $action_view   = new TDataGridAction( ['OrcamentoFormView', 'onView'], ['key' => '{id}', 'register_state' => 'false']);
        $action_edit   = new TDataGridAction( ['OrcamentoForm', 'onEdit'], ['key' => '{id}']);
        $action_delete = new TDataGridAction( [$this, 'onDelete'], ['key' => '{id}']);
        
        $this->datagrid->addAction( $action_view, 'Visualizar', 'fa:search green');
        $this->datagrid->addAction( $action_edit, 'Editar', 'fa:edit blue');
        $this->datagrid->addAction( $action_delete, 'Excluir', 'fa:trash-alt red');
        
        $this->datagrid->createModel();
        
        $this->pageNavigation = new TPageNavigation;
        $this->pageNavigation->setAction( new TAction( [$this, 'onReload']) );
        
        $panel = new TPanelGroup;
        $panel->add($this->datagrid);
        $panel->addFooter($this->pageNavigation);
        
      $vbox = new TVBox;
        $vbox->style = 'width: 100%';
        $vbox->add($this->form);
        $vbox->add($panel);
        
        parent::add( $vbox );
    }
}
