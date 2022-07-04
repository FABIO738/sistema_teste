<?php

/**
 * ContaReceber Active Record
 * @author  <your-name-here>
 */
class ContaPagar extends TRecord
{
    const TABLENAME = 'conta_pagar';
    const PRIMARYKEY= 'id';
    const IDPOLICY =  'max'; // {max, serial}
    
    
    /**
     * Constructor method
     */
    public function __construct($id = NULL, $callObjectLoad = TRUE)
    {
        parent::__construct($id, $callObjectLoad);
        parent::addAttribute('dt_emissao');
        parent::addAttribute('dt_vencimento');
        parent::addAttribute('dt_pagamento');
        parent::addAttribute('cliente_id');
        parent::addAttribute('valor');
        parent::addAttribute('ano');
        parent::addAttribute('mes');
        parent::addAttribute('obs');
        parent::addAttribute('ativo');
    }

   public function get_cliente()
    {
        return Cliente::find($this->nome);
    }
}


