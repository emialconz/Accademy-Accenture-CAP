using { ges_Tienda as ges_Tienda } from '../db/schema';

service api {
    entity Tiendas as SELECT from ges_Tienda.Tiendas{*,        
    };
    entity Propietarios as SELECT from ges_Tienda.Propietarios{*,
    };
    entity Productos as SELECT from ges_Tienda.Productos{*,
    };
    entity Marcas as SELECT from ges_Tienda.Marcas{*,
    };
    entity Precio as SELECT from ges_Tienda.Precio{*,
    };
    entity Propietarios_Tiendas as SELECT from ges_Tienda.Propietarios_Tiendas{*,
    };
    entity Tiendas_Productos as SELECT from ges_Tienda.Tiendas_Productos{*,
    };
    
    action actualizarPrecio(precio:Precio) returns String;
    action controlStock(productoID: ) returns String;
}