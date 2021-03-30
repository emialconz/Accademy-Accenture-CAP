using { myTienda as my } from '../db/schema';

service api {
    entity Productos as SELECT from my.Productos{*,        
    };
    entity Tiendas as SELECT from my.Tiendas{*,
    };
    entity Precio as SELECT from my.Precio{*,
    };
    entity Tiendas_Productos as SELECT from my.Tiendas_Productos{*,
    };
}