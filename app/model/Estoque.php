
<?php
class Estoque extends TRecord
{
    const TABLENAME  = 'estoque';
    const PRIMARYKEY = 'id';
    const IDPOLICY   = 'max'; // {max,serial}
    
    public function __construct($id = null, $callObjectLoad = true)
    {
        parent::__construct($id, $callObjectLoad);
        
        parent::addAttribute('nome');
        parent::addAttribute('quantidade');
       
    }
}
