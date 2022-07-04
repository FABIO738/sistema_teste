<?php
/**
 * Cliente Active Record
 * @author  <your-name-here>
 */
class CidadeList extends TRecord
{
    const TABLENAME = 'cliente';
    const PRIMARYKEY= 'id';
    const IDPOLICY =  'max'; // {max, serial}
    
    const CREATEDAT = 'created_at';
    const UPDATEDAT = 'updated_at';
    
    private $cidade;
    private $categoria;
    
    /**
     * Constructor method
     */
    public function __construct($id = NULL, $callObjectLoad = TRUE)
    {
        parent::__construct($id, $callObjectLoad);
        parent::addAttribute('nome');
        parent::addAttribute('endereco');
        parent::addAttribute('telefone');
        parent::addAttribute('nascimento');
        parent::addAttribute('situacao');
        parent::addAttribute('email');
        parent::addAttribute('genero');
        parent::addAttribute('categoria_id');
        parent::addAttribute('cidade_id');
        parent::addAttribute('created_at');
        parent::addAttribute('updated_at');
    }

    public function get_categoria()
    {
        if (empty($this->categoria))
        {
            $this->categoria = new Categoria($this->categoria_id);
        }
        return $this->categoria;
    }
    
    public function get_cidade()
    {
        if (empty($this->cidade))
        {
            $this->cidade = new Cidade($this->cidade_id);
        }
        return $this->cidade;
    }
    
    
    public function onBeforeLoad($id)
    {
        // echo "Antes de carregar o regitro $id <br>";
    }
    
    public function onAfterLoad($object)
    {
        // print_r($object);
    }
    
    public function onBeforeStore($object)
    {
        // echo "<b>Antes de gravar o objeto</b> <br>";
        // print_r($object);
        // echo "<br>";
    }
    
    public function onAfterStore($object)
    {
        // echo "<b>Depois de gravar o objeto</b> <br>";
        // print_r($object);
        // echo "<br>";
    }
    
    public function onBeforeDelete($object)
    {
        // echo "<b>Antes de excluir o objeto</b> <br>";
        // print_r($object);
        // echo "<br>";
    }
    
    public function onAfterDelete($object)
    {
        // echo "<b>Depois de excluir o objeto</b> <br>";
        // print_r($object);
        // echo "<br>";
    }

}

/*class CidadeList extends TPage
{
    private $form;
    
    use Adianti\Base\AdiantiStandardFormTrait;
    
    public function __construct()
    {
        parent::__construct();
        
        $this->setDatabase('curso');
        $this->setActiveRecord('Cidade');
        
        $this->form = new BootstrapFormBuilder;
        $this->form->setFormTitle('Cidade');
        $this->form->setClientValidation( true );
        
        $id  = new TEntry('id');
        $nome = new TEntry('nome');
        $estado = new TDBCombo('estado_id', 'curso', 'Estado', 'id', 'nome');
        $id->setEditable(FALSE);
        
        $this->form->addFields( [new TLabel('Id')], [$id] );
        $this->form->addFields( [new TLabel('Nome', 'red')], [$nome] );
        $this->form->addFields( [new TLabel('Estado', 'red')], [$estado] );
        
        $nome->addValidation('Nome', new TRequiredValidator);
        $estado->addValidation('Estado', new TRequiredValidator);
        
        $this->form->addAction('Salvar', new TAction( [$this, 'onSave'] ), 'fa:save green');
        $this->form->addActionLink('Limpar', new TAction( [$this, 'onClear'] ), 'fa:eraser red');
        
        parent::add($this->form);
    }


/*class CidadeList extends TPage
{
    private $form;
    private $datagrid;
    private $pageNavigation;
    private $loaded;
    
    public function __construct()
    {
        parent::__construct();
        
        
        $this->form = new BootstrapFormBuilder;
        $this->form->setFormTitle('Cidades');
        
        $nome = new TEntry('nome');
        
        $nome->setValue( TSession::getValue('CidadeList_nome') );
        
        $this->form->addFields( [new TLabel('Nome')], [$nome] );
        
        $this->form->addAction('Buscar', new TAction([$this, 'onSearch']), 'fa:search blue');
        $this->form->addActionLink('Novo', new TAction( ['CidadeList', 'onClear']), 'fa:plus-circle green');
        
        
        $this->datagrid = new BootstrapDatagridWrapper(new TDataGrid);
        $this->datagrid->width = '100%';
        
        $col_id     = new TDataGridColumn('id', 'Cód', 'right', '10%');
        $col_nome   = new TDataGridColumn('nome', 'Nome', 'left', '60%');
        $col_estado = new TDataGridColumn('estado->nome', 'Estado', 'center', '30%');
        
        $col_id->setAction( new TAction( [$this, 'onReload'] ), ['order' => 'id']);
        $col_nome->setAction( new TAction( [$this, 'onReload'] ), ['order' => 'nome']);
        
        $this->datagrid->addColumn($col_id);
        $this->datagrid->addColumn($col_nome);
        $this->datagrid->addColumn($col_estado);
        
        $action1 = new TDataGridAction( ['CidadeList', 'onEdit'], [ 'key' => '{id}'] );
        $action2 = new TDataGridAction( [$this, 'onDelete'], [ 'key' => '{id}'] );
        
        $this->datagrid->addAction( $action1, 'Editar', 'fa:edit blue');
        $this->datagrid->addAction( $action2, 'Excluir', 'fa:trash-alt red');
        
        $this->datagrid->createModel();
        
        $this->pageNavigation = new TPageNavigation;
        $this->pageNavigation->setAction( new TAction([$this, 'onReload'] ));
        
        
        $panel = new TPanelGroup;
        $panel->add($this->datagrid);
        $panel->addFooter($this->pageNavigation);
        
        $vbox = new TVBox;
        $vbox->style = 'width: 100%';
        $vbox->add($this->form);
        $vbox->add($panel);
        
        
        
        parent::add( $vbox );
    }
    
    public function onSearch($param)
    {
        $data = $this->form->getData();
        
        if (isset($data->nome))
        {
            $filter = new TFilter('nome', 'like', "%{$data->nome}%");
            
            TSession::setValue('CidadeList_filter', $filter);
            TSession::setValue('CidadeList_nome', $data->nome);
            
            $this->form->setData($data);
        }
        
        $this->onReload( [] );
    }
    
    public function onReload($param)
    {
        try
        {
            TTransaction::open('curso');
            
            $repository = new TRepository('Cidade');
            
            if (empty($param['order']))
            {
                $param['order'] = 'id';
                $param['direction'] = 'asc';
            }
            
            $limit = 10;
            
            $criteria = new TCriteria;
            $criteria->setProperty('limit', $limit);
            $criteria->setProperties($param);
            
            if (TSession::getValue('CidadeList_filter'))
            {
                $criteria->add(TSession::getValue('CidadeList_filter'));
            }
            
            $cidades = $repository->load( $criteria );
            
            $this->datagrid->clear();
            if ($cidades)
            {
                foreach ($cidades as $cidade)
                {
                    $this->datagrid->addItem($cidade);
                }
            }
            
            
            $criteria->resetProperties();
            $count = $repository->count($criteria);
            
            $this->pageNavigation->setCount($count);
            $this->pageNavigation->setProperties($param);
            $this->pageNavigation->setLimit($limit);
            
            $this->loaded = true;
            TTransaction::close();
        }
        catch (Exception $e)
        {
            new TMessage('error', $e->getMessage());
        }
    }
    
    public static function onDelete($param)
    {
        $action = new TAction( [__CLASS__, 'Delete'] );
        $action->setParameters($param);
        new TQuestion('Deseja excluir o registro?', $action);
    }
    
    public static function Delete($param)
    {
        try
        {
            TTransaction::open('curso');
            
            $key = $param['key'];
            
            $cidade = new Cidade;
            $cidade->delete($key);
            
            $pos_action = new TAction([__CLASS__, 'onReload']);
            new TMessage('info', 'Registro excluído', $pos_action);
            
            TTransaction::close();
        }
        catch (Exception $e)
        {
            new TMessage('error', $e->getMessage());
            TTransaction::rollback();
        }
    }
    
    function show()
    {
        if (!$this->loaded)
        {
            $this->onReload( func_get_arg(0) );
        }
        parent::show();
    }
    public function onClear($param)
 {
 $this->form->clear();
 }
 public function onEdit($param)
 {
 $this->form->clear();
 }*/
   
