<?php

/**
 * Venda Active Record
 * @author  <your-name-here>
 */
class Orcamento extends TRecord
{
    const TABLENAME = 'orcamento';
    const PRIMARYKEY= 'id';
    const IDPOLICY =  'max'; // {max, serial}
    
    
    private $cliente;
    
    /**
     * Constructor method
     */
    public function __construct($id = NULL, $callObjectLoad = TRUE)
    {
        parent::__construct($id, $callObjectLoad);
        parent::addAttribute('dt_orcamento');
        parent::addAttribute('total');
        parent::addAttribute('cliente_id');
        parent::addAttribute('obs');
    }

    public function get_cliente()
    {
        if (empty($this->cliente))
        {
            $this->cliente = new Cliente($this->cliente_id);
        }
        return $this->cliente;
    }

}

