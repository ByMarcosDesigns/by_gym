# by_gym

ENG | INSTALLATION!

1. Download the repository and extract it in the resource folder of our server
2. Open our server.cfg (or where we have the start of all our scripts)
3. Put start by_gym
4. Save server.cfg file
5. Open the server and enjoy the gym!


ESP | INSTALACION! 

1. Descargar el repositorio y extraerlo en la carpeta resource de nuestro servidor
2. Abrir nuestro server.cfg (o donde tengamos el start de todos nuestros scripts)
3. Poner start by_gym
4. Guardar el server.cfg
5. Abrir el servidor y disfrutar del gym!


--Configuration!!

# ENG
  Hello everyone, welcome to my repository. Today I present my gym system for esx. I hope you all like it and thank you very much for trusting me!
  Next I am going to show you how you can configure the script!

  !Config explanation
  
  #Config.MemberShipPrice (This section is used to set the price of the MemberShipp)
  #Config.EnableSkills (This is useful in case you want to put the skills in the gym)
  #Config.NameExportSkill (This is the name of the script you use from the scripting system)
  #Config.TextToGym (Text that you can see at the points of the gym where you exercise)
  #Config.Text3d (This section serves to put if you use a 3d text or one on the 2d screen the one you like the most)
  #Config.TimerToRest (The time it takes to be able to do an exercise again)

  #Config.Items (Here you will put the items that are going to be sold in the gym store, here you have a template to put more objects : 

    {
        ['item'] = 'water', --Here is the name of the item in the database.
        ['label'] = 'Water', --Here the name goes what you want to appear in the store.
        ['price'] = 5, --Here is the price at which it will be sold.
    },
  )

  #Config.Zones (This is where the magic is, we have two types of insoles, the tineda and the knitted ones for exercising. : 
  
  Tienda : 
    tinedaGym = {
        ['pos'] = vector3(0.0, 0.0, 0.0), --Here we will put the coordinates where the store point will be
        ['dist'] = 2, --This is the distance that must be between the player and the tineda for it to display the message (I recommend leaving it like this)
        ['type'] = 'shop', --That is the type of point that it is, that there are two and they are 'shop' and 'gym'
        ['menu'] = { -- Here we will put what the menu is going to have (This leave it like that and do not touch)
            { label = 'Shop', value = 'itemS' },
            { label = 'Membership', value = 'ship' },
        }
    },
  
  Punto de ejercicio:
    exercice = {
        ['pos'] = vector3(0.0, 0.0, 0.0), --Here we will put the coordinates where the point of the exercise will be
        ['dist'] = 2, --This is the distance that must be between the player and the tineda for it to display the message (I recommend leaving it like this)
        ['label'] = 'arms', --Here is the name of the activity that will appear next to the gym text
        ['type'] = 'gym', --That is the type of point that it is, that there are two and they are 'gym' and 'shop'
        ['anim'] = 'world_human_muscle_free_weights', --The type of animation the character does when hitting the E
        ['skill'] = { 
            {
                ['name'] = 'Strength', --The name of the skill we want to give
                ['level'] = 2, --The number to upload to the skill (Not all skill systems are available for this script)
            },
        },
    },

  )

#ESP
  Hola a todos, bienvenidos a mi repositorio. El dia de hoy vengo a presentar mi sistema de gym para esx. Espero que les guste mucho y si tienen algun problema no duden en   
  contactarme! A continuacion voy a enseñarles como pueden configurar el script!
  
  !Explicacion config 
  
  #Config.MemberShipPrice (Este apartado sirve para poner el precio de el MemberShip)
  #Config.EnableSkills (Esto sirve  por si quieren poner las skills en el gym)
  #Config.NameExportSkill (Esto es el nombre del script que usais del sistema de scripts)
  #Config.TextToGym (Texto que podras ver en los puntos del gym en los que se hace ejercicio)
  #Config.Text3d (Este apartado sirve para poner si se usa un texto 3d o uno en la pantalla 2d el que mas les guste)
  #Config.TimerToRest (El tiempo que tarda en poder volver a hacer un ejercicio)
  
  #Config.Items (Aqui se pondran los items que se van a vender en la tienda del gym, aqui teneis una plantilla para poner mas objetos : 

    {
        ['item'] = 'water', --Aqui va el nombre que tiene el item en la base de datos.
        ['label'] = 'Water', --Aqui el nombre va lo que quieres que aparezca en la tienda.
        ['price'] = 5, --Aqui va el precio al que se va a vender.
    },
  )

  #Config.Zones (Aqui es donde esta la magia, tenemos dos tipos de plantillas, las de tineda y las de punto para hacer ejercicio. : 
  
  Tienda : 
    tinedaGym = {
        ['pos'] = vector3(0.0, 0.0, 0.0), --Aqui pondremos las coordenadas donde va a estar el punto de tienda
        ['dist'] = 2, --Esto es la distancia que tiene que haber entre el jugador y la tineda para que muestre el mensaje (recomiendo dejarlo asi)
        ['type'] = 'shop', --Eso es el tipo de punto que es, que hay dos y son 'shop' y 'gym' 
        ['menu'] = { -- Aqui pondremos que va a tener el menu (Esto dejarlo asi y no tocar)
            { label = 'Shop', value = 'itemS' },
            { label = 'Membership', value = 'ship' },
        }
    },
  
  Punto de ejercicio:
    exercice = {
        ['pos'] = vector3(0.0, 0.0, 0.0), --Aqui pondremos las coordenadas donde va a estar el punto del ejercicio
        ['dist'] = 2, --Esto es la distancia que tiene que haber entre el jugador y la tineda para que muestre el mensaje (recomiendo dejarlo asi)
        ['label'] = 'arms', --Aqui es el nombre de la actividad que va a aparecer junto al al texto del gym
        ['type'] = 'gym', --Eso es el tipo de punto que es, que hay dos y son 'gym' y 'shop' 
        ['anim'] = 'world_human_muscle_free_weights', --El tipo de animacion que hace el pj al darle a la E
        ['skill'] = { 
            {
                ['name'] = 'Strength', --El nombre de la skill que queremos dar
                ['level'] = 2, --El numero que le sube a la skill (No todos los sistemas de skills estan disponibles para este script) 
            },
        },
    },

  )
