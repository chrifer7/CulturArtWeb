# ruby encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

attrib_types = Content::AttributeType.create([
                            {name: "TextBox", description: "Valores únicos"},
                            {name: "Select", description: "Un valor de una lista"},
                            {name: "MultiSelect", description: "Multi"},
                            {name: "TextArea", description: "Área única"}
                          ])
                          
data_types = Content::DataType.create([ 
                        {name: "Number"},
                        {name: "Integer"},
                        {name: "String"},
                        {name: "Text"}
                      ])                          

attributes = Content::Attribute.create([
            {name: "Cronología", description: "Filiación Cronológica", 
            slug: "tipo_crono", obj_attribute_type: attrib_types[1], obj_data_type: nil },
            {name: "Morfología", description: "Filiación Morfológica", 
            slug: "tipo_morfo", obj_attribute_type: attrib_types[1], obj_data_type: nil },
            {name: "Época", description: "Época de creación", 
            slug: "epoca", obj_attribute_type: attrib_types[1], obj_data_type: nil },
            {name: "Cultura", description: "Cultura dentro de la se se originó", 
            slug: "cultura", obj_attribute_type: attrib_types[1], obj_data_type: nil },
            
            {name: "Autor", description: "Autor o autores", 
            slug: "list_autor", obj_attribute_type: attrib_types[2], obj_data_type: nil },
            {name: "Materiales de Construcción", description: "Materiales usados", 
            slug: "list_mat_construc", obj_attribute_type: attrib_types[2], obj_data_type: nil },
            {name: "Afectaciones Naturales", description: "Daños naturales", 
            slug: "list_afecta_natur", obj_attribute_type: attrib_types[2], obj_data_type: nil },
            {name: "Afectaciones Antropológicas", description: "Daños causados por el hombre", 
            slug: "list_afecta_antro", obj_attribute_type: attrib_types[2], obj_data_type: nil },
            
            {name: "Edad aproximada", description: "Edad aproximada", 
            slug: "edad", obj_attribute_type: attrib_types[0], obj_data_type: data_types[1] },
            {name: "Otro nombre", description: "Nombre alternativo", 
            slug: "otro_nombre", obj_attribute_type: attrib_types[0], obj_data_type: data_types[2] }
                      ])
                      
attrib_values = Content::AttributeValue.create([
  #Morfología
  #0
            {name: 'Abrigo rocoso', description: 'Formaciones geológicas en forma de cavidad sin mayor profundidad.',
            attribute_id: attributes[1].id, obj_attribute: attributes[1], icon: File.open(File.join(Rails.root,'public/assets/img/icons/abrigo_rocoso.png'))},
            {name: 'Aldea', description: 'Conjunto de recintos destinados a las viviendas que no ocupan grandes extensiones.',
            attribute_id: attributes[1].id, obj_attribute: attributes[1], icon: File.open(File.join(Rails.root,'public/assets/img/icons/aldea.png'))},
            {name: 'Área de actividad', description: 'Áreas que presentan evidencia de actividad humana, aunque carecen de arquitectura formal. Ej.: talleres líticos, basurales, conchales, entre otros.',
            attribute_id: attributes[1].id, obj_attribute: attributes[1], icon: File.open(File.join(Rails.root,'public/assets/img/icons/area_de_actividad.png'))},
            {name: 'Cementerio', description: 'Área que presenta evidencias de uso funerario.',
            attribute_id: attributes[1].id, obj_attribute: attributes[1], icon: File.open(File.join(Rails.root,'public/assets/img/icons/cementerio.png'))},
            {name: 'Ciudadela', description: 'Conjunto de recintos organizados y de dimensiones variables, destinados a funciones diversas: administrativas, religiosas, productivas, políticas, públicas, etc.; además de otras que sean identificadas.',
            attribute_id: attributes[1].id, obj_attribute: attributes[1], icon: File.open(File.join(Rails.root,'public/assets/img/icons/ciudadela.png'))},
            {name: 'Complejo piramidal', description: 'Conjunto de pirámides que incluyen plazas y otras estructuras.',
            attribute_id: attributes[1].id, obj_attribute: attributes[1], icon: File.open(File.join(Rails.root,'public/assets/img/icons/complejo_piramidal.png'))},
            {name: 'Cueva', description: 'Cavidades en el interior de las formaciones geológicas producto de erosión hídrica como parte del proceso de formación de los continentes.',
            attribute_id: attributes[1].id, obj_attribute: attributes[1], icon: File.open(File.join(Rails.root,'public/assets/img/icons/cueva.png'))},
            {name: 'Estructura aislada', description: 'Estructura aislada que no tiene asociaciones con otras estructuras.',
            attribute_id: attributes[1].id, obj_attribute: attributes[1], icon: File.open(File.join(Rails.root,'public/assets/img/icons/estructura_aislada.png'))},
            {name: 'Estructura funeraria', description: 'Estructura arquitectónica de uso funerario.',
            attribute_id: attributes[1].id, obj_attribute: attributes[1], icon: File.open(File.join(Rails.root,'public/assets/img/icons/estructura_funeraria.png'))},
            {name: 'Geoglifos', description: 'Dibujos o diseños realizados en la superficie de terrenos, generalmente de forma regular.',
            attribute_id: attributes[1].id, obj_attribute: attributes[1], icon: File.open(File.join(Rails.root,'public/assets/img/icons/geoglifos.png'))},
            {name: 'Montículo', description: 'Estructura arquitectónica erosionada que no permite caracterizarla mientras no sea excavada científicamente.',
            attribute_id: attributes[1].id, obj_attribute: attributes[1], icon: File.open(File.join(Rails.root,'public/assets/img/icons/monticulo.png'))},
            {name: 'Otros', description: 'Coloque la descripción de otro tipo que el registrador considere, pero precisando sus características.',
            attribute_id: attributes[1].id, obj_attribute: attributes[1], icon: File.open(File.join(Rails.root,'public/assets/img/icons/otros.png'))},
            {name: 'Paraviento', description: 'Elemento aislado de carácter temporal, no formal, conformado por acomodo de piedras.',
            attribute_id: attributes[1].id, obj_attribute: attributes[1], icon: File.open(File.join(Rails.root,'public/assets/img/icons/paraviento.png'))},
            {name: 'Petroglifos', description: 'Dibujos o diseños realizados por percusión en la superficie de formaciones geológicas.',
            attribute_id: attributes[1].id, obj_attribute: attributes[1], icon: File.open(File.join(Rails.root,'public/assets/img/icons/petroglifos.png'))},
            {name: 'Pinturas rupestres', description: 'Dibujos o diseños realizados en las superficies de formaciones geológicas en base a pigmentos naturales o minerales.',
            attribute_id: attributes[1].id, obj_attribute: attributes[1], icon: File.open(File.join(Rails.root,'public/assets/img/icons/pinturas_rupestres.png'))},
            {name: 'Pirámide', description: 'Estructura compuesta de una o más plataformas superpuestas una sobre la otra.',
            attribute_id: attributes[1].id, obj_attribute: attributes[1], icon: File.open(File.join(Rails.root,'public/assets/img/icons/piramide.png'))},
            {name: 'Plataformas', description: 'Estructura sobreelevada de uso ceremonial o administrativo.',
            attribute_id: attributes[1].id, obj_attribute: attributes[1], icon: File.open(File.join(Rails.root,'public/assets/img/icons/plataformas.png'))},
            {name: 'Sistema agrícola', description: 'Sistemas de andenerías, aterrazados, entre otros, para el cultivo.',
            attribute_id: attributes[1].id, obj_attribute: attributes[1], icon: File.open(File.join(Rails.root,'public/assets/img/icons/sistema_agricola.png'))},
            {name: 'Sistema de camino', description: 'Sistemas de caminos.',
            attribute_id: attributes[1].id, obj_attribute: attributes[1], icon: File.open(File.join(Rails.root,'public/assets/img/icons/sistema_de_camino.png'))},
            {name: 'Sistema hidráulico', description: 'Canales, acueductos, reservorios, entre otros.',
            attribute_id: attributes[1].id, obj_attribute: attributes[1], icon: File.open(File.join(Rails.root,'public/assets/img/icons/sistema_hidraulico.png'))},
            {name: 'Sitio amurallado', description: 'Monumentos arqueológicos circundados por una muralla. Ej.: aldeas fortificadas, fortalezas, centros ceremoniales, miradores, entre otros.',
            attribute_id: attributes[1].id, obj_attribute: attributes[1], icon: File.open(File.join(Rails.root,'public/assets/img/icons/sitio_amurallado.png'))},
            {name: 'Terrazas habitacionales', description: 'Estructuras que permiten el acondicionamiento de terrenos en pendiente con el fin de habitarlos.',
            attribute_id: attributes[1].id, obj_attribute: attributes[1], icon: File.open(File.join(Rails.root,'public/assets/img/icons/terrazas_habitacionales.png'))},

                        
      #Cronología
      #22
            {name: 'Horizonte Medio', description: '(1000 - 1470 DC)\nDespués de las grandes sociedades del Horizonte Medio, los Andes volverán a un panorama de sociedades regionales, independientes, y, en la mayoría de los casos, con territorios de escala reducida. Estos sociedades se enfrentarán a menudo entre ellas, sobre todo en la sierra. La arquitectura fortificada de piedra en las cimas de cerros en la sierra central son un testigo de estas épocas inestables.',
            attribute_id: attributes[0].id, obj_attribute: attributes[0], icon: File.open(File.join(Rails.root,'public/assets/img/icons/horizonte_medio.png'))},
            {name: 'Horizonte Tardío', description: '(1470 - 1532 DC)\nEste es el periodo en el que la sociedad Inca crea un imperio que controla los Andes desde el sur de Colombia hasta el centro de Chile, dominando cerca de 5000 kilómetros de la cordillera y costa andina. Es el último periodo de la secuencia histórica nativa andina, y será el más corto durando solamente unos 70 a 80 años. La sociedad Inca creará un sistema administrativo muy complejo para manejar los extensos territorios y a la gente muy diversa bajo su poder. Utilizarán herramientas administrativas como los quipus (cuerdas anudadas, los complejos sitios administrativos, los extensos centros del almacenaje, la larga red de caminos, y los movimientos masivos de poblaciones. (Algunos de estos dispositivos se pudieron haber utilizado, en mayor o menor grado, en las sociedades estatales y expansivas del Horizonte Medio).',
            attribute_id: attributes[0].id, obj_attribute: attributes[0], icon: File.open(File.join(Rails.root,'public/assets/img/icons/horizonte_tardio.png'))},            
                        
      #Cultura
      #24
            {name: 'Cultura Inca', description: 'La civilización incaica o quechua, fue la última de las grandes civilizaciones precolombinas que conservó su estado independiente (imperio incaico) durante la Conquista de América, hasta la conquista del Perú (1532-1533). Con la extensión del imperio, ésta fue absorbiendo nuevas expresiones culturales de los pueblos anexados y se ubicó en los actuales territorios del Perú, Argentina, Bolivia, Chile, Colombia y Ecuador.',
            attribute_id: attributes[3].id, obj_attribute: attributes[3], icon: File.open(File.join(Rails.root,'public/assets/img/icons/inca.png'))},
            {name: 'Cultura chimú', description: 'Chimú o Chimor es una cultura pre incaica que se desarrollo en la costa norte tras el decaimiento del Imperio huari entre los años 1000 y 1200. Ocuparon los territorios que antes habitaron los mochicas, llegando a expandir sus dominios, en su etapa de mayor desarrollo, por toda una extensa franja del norte del Perú, desde Tumbes hasta el valle de Huarmey, con una extensión de 50 kilómetros al cuadrado.',
            attribute_id: attributes[3].id, obj_attribute: attributes[3], icon: File.open(File.join(Rails.root,'public/assets/img/icons/tumi.png'))},
      
      #Época
      #26
            {name: 'Época Prehispánica', description: 'Etapa comprendida antes de la llegada de los españoles en 1532. La economía en ese tiempo era agraria y colectivista. Existía un gobierno autocrático. Existía una creencia en otros dioses, su dios supremo era el Sol (Wiracocha). Se hacía uso de varias lenguas: yunga, tallán, muchik (costa) quechua (sierra) aymara, puquina (zona del altiplano). El idioma oficial del imperio era el Quechua o Runasimi. \nLo que se conoce de la literatura prehispánica se refiere más a las manifestaciones habidas entre los incas, y muy poco de las culturas más antiguas (Chavín, Wari, Mochica- Chimu, etc.), esto porque los cronistas españoles tuvieron más contacto con la cultura Inca. A pesar de que los incas no conocieran la escritura, esto no significa que no tuvieran manifestaciones artísticas y literarias.',
            attribute_id: attributes[2].id, obj_attribute: attributes[2], icon: File.open(File.join(Rails.root,'public/assets/img/icons/prehispanica.png'))},
            {name: 'Época de la Conquista', description: 'Se dio la destrucción de la organización social, política y cultural del Tahuantinsuyo. Una cruzada religiosa e imposición del idioma castellano. Llegan los primeros cronistas españoles (Jerez, Estete, Pedro Pizarro) \nSe da una guerra civil entre los españoles conquistadores. Ejecución de tupas Amaru I, por órdenes de Toledo (1572).',
            attribute_id: attributes[2].id, obj_attribute: attributes[2], icon: File.open(File.join(Rails.root,'public/assets/img/icons/consquista.png'))}      
])

heritages = []
100.times do |n|
    n_s = (n+1).to_s
    
    _lat = -12.072937549755197 + (rand * 0.2 - 0.1)
    _lon = -77.08089351654053 + (rand * 0.2 - 0.1)
    _alt = 10 + (rand * 10)
    
    h_n = Content::Heritage.create(
        {name: "Patrimonio "+n_s,
        description: "Una descripción "+n_s,
        brief_history: "Una breve historia "+n_s,
        extention: rand(2000..200000),
        lat: _lat, 
        lon: _lon,               
        alt: _alt,
        perimeter: rand(200..20000),
        geo_location: "Una geolocation "+n_s, 
        access_routes: "Diversas rutas de acceso "+n_s 
        }  
      )
    
    #Morfología
    h_n.heritage_attrib_values.create(
        content_heritage_id: h_n.id,
        content_attribute_value_id: attrib_values[0 + Random.rand(22)].id
    )
    
    #Cronología
    h_n.heritage_attrib_values.create(
        content_heritage_id: h_n.id,
        content_attribute_value_id: attrib_values[22 + Random.rand(2)].id
    )
        
    #Época
    h_n.heritage_attrib_values.create(
        content_heritage_id: h_n.id,
        content_attribute_value_id: attrib_values[26 + Random.rand(2)].id
    )
    
    #Cultura
    h_n.heritage_attrib_values.create(
        content_heritage_id: h_n.id,
        content_attribute_value_id: attrib_values[24 + Random.rand(2)].id
    )
    
    #Edad aproximada
    h_n.heritage_attributes.create(
        content_heritage_id: h_n.id,
        content_attribute_id: attributes[8].id,
        value: "Muy viejo "+n_s
    )
    
    #Otro nombre
    h_n.heritage_attributes.push.create(
        content_heritage_id: h_n.id,
        content_attribute_id: attributes[9].id,
        value: "Mi otro nombre "+n_s
    )
    
    h_n.list_overlayed_imgs.create(
        alt_img: _alt,
        alt_user: _alt,
        heritage_id: h_n.id,
        history: "Hubo una vez una foto "+n_s,
        lat_img: _lat + 0.00025, 
        lat_user: _lat + 1.5 * 0.00025, 
        lon_img: _lon + 0.00025, 
        lon_user: _lon + 1.5 * 0.00025, 
        name: "El nombre de la foto "+n_s, 
        url: "",
        avatar: File.open(File.join(Rails.root,'public/assets/img/pat/pat_'+(Random.rand(8) + 1).to_s+'.jpg'))
    )
    
    heritages.push(h_n)
end
                      
# i = 0

# 1000.times do |n|
    # heritage = Content::Heritage.create([
        # {name: Faker::Lorem.sentence(rand(2..10)).chomp('.'),
        # description: Faker::Lorem.paragraphs(rand(2..8)).join('\n'),
        # brief_history: Faker::Lorem.paragraphs(rand(2..8)).join('\n'),
        # extention: rand(2000..200000),
        # lat: -12.072937549755197 + (rand * 2 - 1), 
        # lon:-77.08089351654053 + (rand * 2 - 1),               
        # alt: 10 + (rand(int) * 10),
        # perimeter: rand(200..20000),
        # geo_location: Faker::Lorem.paragraphs(rand(2..8)).join('\n'), 
        # access_routes: Faker::Lorem.paragraphs(rand(2..8)).join('\n') 
        # }  
      # ])
# end


