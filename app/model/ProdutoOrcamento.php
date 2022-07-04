<?php

class ProdutoOrcamento extends TRecord
{
    const TABLENAME  = 'produto_orcamento';
    const PRIMARYKEY = 'id';
    const IDPOLICY   = 'max'; // {max,serial}
    
    public function __construct($id = null, $callObjectLoad = true)
    {
        parent::__construct($id, $callObjectLoad);
        
        parent::addAttribute('descricao');
        parent::addAttribute('preco_venda');
       
    }
}
