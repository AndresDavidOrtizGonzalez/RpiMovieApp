# RpiMovieApp


Es un proyecto de prueba con la base de datos de peliculas. Se desarrollo usando patron modelo vista controlador MVC. Las vistas fueron creadas programaticamente.

Para el modelo se crearon las clases RPIMovie.swift, RPISearch.swift, RPIDateRange.swift, RPIMedia.swift y RPIVideo.swift con los campos  descritos por la Api y con cualidad codable para encode y decode. De esta manera su serializacion a JSON y viceversa es rapida y sencilla.

Los Controladores son 2 y se describen a continuacion
RPIMoviesHomecontrola los listados de peliculas segun su categoria (Popular, Top Rated y Upcoming)

RPIMovieDetailedViewController para la vista detallada que se incluye un plot (overview) mas extenso. Un video que puede reproducirse en fullscreen. Y 1 boton  o ir a comprar en Amazon (sin funcionalidad, era solo por motivos estaticos y de practiciad). 


Para persistencia se uso archivos .json con el FileManager. Al correr la app por primera vez se crean los directorios donde se persistiran los archivos. Los nombres de los archivos tendra el campo id concatenado con .json

Para la carga asincrona de imagenes se uso

    pod 'Alamofire', '~> 4.7'
    pod 'SDWebImage', '~> 4.0'

Mejorando la experiencia de usuario y permitiendo guardar en cache las imagenes hasta un limite de 10MB. Pudiendo asi ver las imagenes incluso sin conexion a internet.

Para reproducir videos de youtube su uso el framework 

    'YouTubePlayer.framework'

Que permite reproduccion en pantalla completa y tienes controles in screen. No esta permitido la reproduccion offline
Para detectar el estado de conexion se uso

    pod 'ReachabilitySwift'


Este helper permite detectar si hay conexión a internet y de cual tipo. tambien permite detectar sino hay conexión

Se crearon 3 singletone para su uso en toda la App 

RPIMovieLoader para cargar data 

RPIMovieStorage para la persistencia

RPIReachability para determinar la conexion a internet.


En qué consiste el principio de responsabilidad única? Cuál es su propósito?
    Basicamente es que cada clase debe tener responsabilidad es solo una parte de la funcionalidad proporcionada por la app. Su proposito es evitar propagación de cambios
    
Qué características tiene, según su opinión, un “buen” código o código limpio

    Se quiere

    Codigo legible
    Codigo portable
    Codigo semantico
    Codigo Identado
    Codigo Modular
    Codigo Testeable
    Comentarios explicando secciones y funcionalidad
    
    Se evita
    
    Evitar codigo espagueti
    Evitar codigo innecesario
    Evitar llamadas recursivas infinitas
    
 
    
Video

[![TheMovieDatabaseApiApp](https://img.youtube.com/vi/7UNEoH5SwXI/0.jpg)](https://youtu.be/7UNEoH5SwXI "TheMovieDatabaseApiApp")

Screen Shots

<a data-flickr-embed="true"  href="https://www.flickr.com/photos/162890832@N07/47444192151/in/dateposted-public/" title="Online Popular"><img src="https://farm8.staticflickr.com/7867/47444192151_d0c8f576d3_b.jpg" width="529" height="975" alt="Online Popular"></a>


<a data-flickr-embed="true"  href="https://www.flickr.com/photos/162890832@N07/47444191901/in/dateposted-public/" title="Online Upcoming"><img src="https://farm8.staticflickr.com/7880/47444191901_2b72f94791_b.jpg" width="518" height="978" alt="Online Upcoming"></a>

<a data-flickr-embed="true"  href="https://www.flickr.com/photos/162890832@N07/47444192021/in/dateposted-public/" title="Online TopRated"><img src="https://farm8.staticflickr.com/7909/47444192021_2769170570_b.jpg" width="501" height="975" alt="Online TopRated"></a>


Offline Browsing


<a data-flickr-embed="true"  href="https://www.flickr.com/photos/162890832@N07/47444191741/in/dateposted-public/" title="Offline Browse"><img src="https://farm8.staticflickr.com/7884/47444191741_e4eae8a584_b.jpg" width="519" height="977" alt="Offline Browse"></a>


Online Browsing

<a data-flickr-embed="true"  href="https://www.flickr.com/photos/162890832@N07/47444191851/in/dateposted-public/" title="Online Browse"><img src="https://farm8.staticflickr.com/7920/47444191851_5a17f4d672_b.jpg" width="490" height="961" alt="Online Browse"></a>

