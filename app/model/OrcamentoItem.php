<?php
/**
 * VendaItem Active Record
 * @author  <your-name-here>
 */
class OrcamentoItem extends TRecord
{
    const TABLENAME = 'orcamento_item';
    const PRIMARYKEY= 'id';
    const IDPOLICY =  'max'; // {max, serial}
    
  private $produto;
    
   
    public function __construct($id = NULL, $callObjectLoad = TRUE)
    {
        parent::__construct($id, $callObjectLoad);
        parent::addAttribute('preco_venda');
        parent::addAttribute('quantidade');
        parent::addAttribute('desconto');
        parent::addAttribute('total');
        parent::addAttribute('produto_id');
        parent::addAttribute('orcamento_id');
    }

    public function get_produto_orcamento()
    {
        if (empty($this->produto_orcamento))
        {
            $this->produto_orcamento = new ProdutoOrcamento($this->produto_id);
        }
        return $this->produto_orcamento;
    }

}

