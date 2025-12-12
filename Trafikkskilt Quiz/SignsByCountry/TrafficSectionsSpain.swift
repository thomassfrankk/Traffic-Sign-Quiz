//
//  TrafficSectionsSpain.swift
//  Trafikkskilt Quiz
//
//  Created by Thomas Frank on 3/10/25.
//

//import Foundation
//
//
//struct TrafficSectionsSpain {
//    
//    // MARK: - Señales de Advertencia de Peligro (Warning Signs)
//    static let advertenciaDePeligro = TrafficSection(
//        name: "Señales de Advertencia de Peligro",
//        description: """
//Las señales de tráfico de peligro sirven como advertencias cruciales, alertando a los conductores de peligros que pueden ser difíciles de detectar a tiempo.
//
//Estas señales, que suelen tener la forma de un triángulo equilátero con fondo blanco y borde rojo, también se conocen como señales de tráfico triangulares. Estas señales indican la presencia de peligros potenciales en la vía.
//
//Al proporcionar una notificación clara y temprana, permiten a los conductores ajustar su velocidad o rumbo, garantizando su seguridad y la de los demás en la carretera.
//
//Reconocer estas señales ayuda a los conductores a anticiparse y reaccionar adecuadamente para evitar accidentes.
//""",
//        /*
//         Warning traffic signs serve as crucial alerts, warning drivers about dangers that may be difficult to detect in time.
//         
//         These signs, usually shaped like an equilateral triangle with a white background and red border, are also known as triangular traffic signs. They indicate the presence of potential hazards on the road.
//         
//         By providing a clear and early warning, they allow drivers to adjust their speed or direction, ensuring their own safety and that of others on the road.
//         
//         Recognizing these signs helps drivers anticipate and react appropriately to avoid accidents.
//         */
//        subSections: nil,
//        signs: [
//            // Example entries — fill in the rest using the pattern
//            TrafficSign(
//                title: "Intersección con prioridad",
//                description: "Peligro por la proximidad de una intersección con una vía, cuyos usuarios deben ceder el paso.",
//                // Warns of an intersection where the road you are driving on has priority.
//                images: ["P1", "P1a", "P1b", "P1c", "P1d", "P1e"],
//                wrongAnswers: [
//                    "Semáforos", // Traffic lights
//                    "Curva peligrosa a la derecha", // Dangerous curve to the right
//                    "Curvas peligrosas", // Dangerous curves
//                    "Puente móvil", // Movable bridge
//                    "Cruce de tranvía", // Tram crossing
//                    "Aeropuerto", // Airport
//                    "Perfil irregular", // Uneven surface
//                    "Resalto" // Speed bump
//                ],
//                sectionName: "Señales de Advertencia de Peligro", // Warning of Danger
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Intersección con prioridad de la derecha",
//                description: "Peligro por la proximidad de una intersección en la que rige la regla general de prioridad de paso.",
//                // Warns of the proximity of a crossing where no priority is indicated.
//                images: ["P2"],
//                wrongAnswers: [
//                    "Intersección con prioridad", // Intersection with priority
//                    "Glorieta", // Roundabout
//                    "Semáforos", // Traffic lights
//                    "Curva peligrosa", // Dangerous curve
//                    "Resalto", // Speed bump
//                    "Carretera resbaladiza", // Slippery road
//                    "Puente móvil", // Movable bridge
//                    "Paso a nivel" // Level crossing
//                ],
//                sectionName: "Señales de Advertencia de Peligro", // Warning of Danger
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Semáforos", // Traffic lights
//                description: "Peligro por la proximidad de una intersección aislada o tramo con la circulación regulada por semáforos.",
//                // Warns of the proximity of an intersection controlled by traffic lights.
//                images: ["P3"],
//                wrongAnswers: [
//                    "Cruce de tranvía", // Tram crossing
//                    "Puente móvil", // Movable bridge
//                    "Curva peligrosa", // Dangerous curve
//                    "Resalto", // Speed bump
//                    "Glorieta", // Roundabout
//                    "Aeropuerto", // Airport
//                    "Carretera resbaladiza", // Slippery road
//                    "Perfil irregular" // Uneven surface
//                ],
//                sectionName: "Señales de Advertencia de Peligro", // Warning of Danger
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Glorieta", // Intersection with circular traffic (roundabout)
//                description: "Peligro por la proximidad de una glorieta con circulación en el sentido indicado por las flechas.",
//                // Warns of the proximity of a roundabout (circular intersection).
//                images: ["P4"],
//                wrongAnswers: [
//                    "Cruce de tranvía", // Tram crossing
//                    "Puente móvil", // Movable bridge
//                    "Semáforos", // Traffic lights
//                    "Curva peligrosa", // Dangerous curve
//                    "Carretera resbaladiza", // Slippery road
//                    "Resalto", // Speed bump
//                    "Aeropuerto", // Airport
//                    "Perfil irregular" // Uneven surface
//                ],
//                sectionName: "Señales de Advertencia de Peligro", // Warning of Danger
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Puente móvil", // Movable bridge
//                description: "Peligro ante la proximidad de un puente que puede ser levantado o girado, interrumpiéndose así temporalmente la circulación.",
//                // Warns of the proximity of a bridge that may open.
//                images: ["P5"],
//                wrongAnswers: [
//                    "Paso a nivel con barreras", // Level crossing with barriers
//                    "Cruce de tranvía", // Tram crossing
//                    "Glorieta", // Roundabout
//                    "Curva peligrosa", // Dangerous curve
//                    "Resalto", // Speed bump
//                    "Aeropuerto", // Airport
//                    "Carretera resbaladiza", // Slippery road
//                    "Perfil irregular" // Uneven surface
//                ],
//                sectionName: "Señales de Advertencia de Peligro", // Warning of Danger
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Cruce de tranvía",
//                description: "Peligro por la proximidad de cruce con una línea de tranvía, que tiene prioridad de paso.",
//                images: ["P6"],
//                wrongAnswers: [
//                    "Paso a nivel con barreras", "Puente móvil", "Glorieta",
//                    "Curva peligrosa", "Resalto", "Aeropuerto", "Carretera resbaladiza", "Perfil irregular"
//                ],
//                sectionName: "Señales de Advertencia de Peligro", // Warning of Danger
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Paso a nivel con barreras",
//                description: "Peligro por la proximidad de un paso a nivel provisto de barreras o semibarreras.",
//                images: ["P7"],
//                wrongAnswers: [
//                    "Pasó a nivel sin barreras", "Puente móvil", "Cruce de tranvía",
//                    "Glorieta", "Curva peligrosa", "Resalto", "Aeropuerto", "Carretera resbaladiza"
//                ],
//                sectionName: "Señales de Advertencia de Peligro", // Warning of Danger
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Paso a nivel sin barreras",
//                description: "Peligro por la proximidad de un paso a nivel no provisto de barreras o semibarreras.",
//                images: ["P8"],
//                wrongAnswers: [
//                    "Paso a nivel con barreras", "Puente móvil", "Cruce de tranvía",
//                    "Glorieta", "Curva peligrosa", "Resalto", "Aeropuerto", "Carretera resbaladiza"
//                ],
//                sectionName: "Señales de Advertencia de Peligro", // Warning of Danger
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Aproximación a un paso a nivel, puente móvil o muelle", // Approach to a level
//                description: "Advierte la proximidad de un paso a nivel, puente móvil o muelle mediante una o varias señales colocadas en serie, que indican la distancia restante hasta el peligro.",
//                // Warns of the approach to a level crossing, movable bridge, or quay using one or more signs placed in series to indicate the remaining distance to the hazard.
//                images: ["P9a", "P9b", "P9c", "P10a", "P10b", "P10c"],
//                wrongAnswers: [
//                    "Paso a nivel con barreras", // Level crossing with barriers
//                    "Puente móvil", // Movable bridge
//                    "Curva peligrosa", // Dangerous curve
//                    "Cruce de tranvía", // Tram crossing
//                    "Resalto", // Speed bump
//                    "Aeropuerto", // Airport
//                    "Glorieta", // Roundabout
//                    "Carretera resbaladiza" // Slippery road
//                ],
//                sectionName: "Señales de Advertencia de Peligro", // Warning of Danger
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Situación de un paso a nivel sin barreras", // Level crossing without barriers
//                description: "Peligro por la presencia inmediata de un paso a nivel sin barreras. En la variante P-11a, indica que existen varias vías férreas.",
//                // Danger due to the immediate presence of a level crossing without barriers. In variant P-11a, it indicates there are multiple railway tracks.
//                images: ["P11", "P11a"],
//                wrongAnswers: [
//                    "Paso a nivel con barreras", // Level crossing with barriers
//                    "Proximidad de un paso a nivel", // Proximity of a level crossing
//                    "Puente móvil", // Movable bridge
//                    "Carretera resbaladiza", // Slippery road
//                    "Curva peligrosa", // Dangerous curve
//                    "Resalto", // Speed bump
//                    "Animales domésticos", // Domestic animals
//                    "Intersección con prioridad de la derecha" // Intersection with right-of-way priority
//                ],
//                sectionName: "Señales de Advertencia de Peligro", // Warning of Danger
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Aeropuerto",
//                description: "Peligro por la proximidad de un lugar donde frecuentemente vuelan aeronaves a baja altura sobre la vía y que pueden originar ruidos imprevistos.",
//                images: ["P12"],
//                wrongAnswers: [
//                    "Área de recreo", "Zona escolar", "Estación de tren",
//                    "Puente móvil", "Cruce de tranvía", "Glorieta",
//                    "Paso de peatones", "Animales en libertad"
//                ],
//                sectionName: "Señales de Advertencia de Peligro", // Warning of Danger
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Curva peligrosa", // Dangerous curves
//                description: "Peligro por la proximidad de una curva peligrosa",
//                images: ["P13a", "P13b"],
//                wrongAnswers: [
//                    "Visibilidad reducida", // Reduced visibility
//                    "Congestión", // Congestion
//                    "Puente estrecho", // Narrow bridge
//                    "Desprendimiento", // Falling rocks
//                    "Glorieta", // Roundabout
//                    "Zona escolar", // School zone
//                    "Animales en libertad" // Wild animals
//                ],
//                sectionName: "Señales de Advertencia de Peligro", // Warning of Danger
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Curvas peligrosas", // Double curve
//                description: "Peligro por la proximidad de una sucesión de curvas peligrosas próximas entre sí, siendo la primera de ellas hacia la derecha o hacia la izquierda.",
//                images: ["P14a", "P14b"],
//                wrongAnswers: [
//                    "Intersección con prioridad", // Intersection with priority
//                    "Glorieta", // Roundabout
//                    "Resalto", // Speed bump
//                    "Perfil irregular", // Uneven surface
//                    "Viento transversal", // Crosswind
//                    "Zona de obras", // Roadworks
//                    "Carretera resbaladiza" // Slippery road
//                ],
//                sectionName: "Señales de Advertencia de Peligro", // Warning of Danger
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Perfil irregular", // Uneven surface
//                description: "Peligro por la proximidad de un resalte o badén en la vía o pavimento en mal estado.", // Warns of a section with bumps or irregularities.
//                images: ["P15"],
//                wrongAnswers: [
//                    "Curva peligrosa", // Dangerous curve
//                    "Puente móvil", // Movable bridge
//                    "Carretera resbaladiza", // Slippery road
//                    "Animales en libertad", // Wild animals
//                    "Cruce de tranvía", // Tram crossing
//                    "Paso a nivel", // Level crossing
//                    "Glorieta" // Roundabout
//                ],
//                sectionName: "Señales de Advertencia de Peligro", // Warning of Danger
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Resalto", // Speed bump
//                description: "Peligro por la proximidad de un resalte en la vía.", // Warns of a speed bump or hump on the road.
//                images: ["P15a"],
//                wrongAnswers: [
//                    "Curva peligrosa", // Dangerous curve
//                    "Puente móvil", // Movable bridge
//                    "Glorieta", // Roundabout
//                    "Cruce de tranvía", // Tram crossing
//                    "Carretera resbaladiza", // Slippery road
//                    "Visibilidad reducida", // Reduced visibility
//                    "Congestión" // Congestion
//                ],
//                sectionName: "Señales de Advertencia de Peligro", // Warning of Danger
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Badén", // Dip
//                description: "Peligro por la proximidad de un badén en la vía",
//                images: ["P15b"],
//                wrongAnswers: [
//                    "Curva peligrosa", // Dangerous curve
//                    "Puente móvil", // Movable bridge
//                    "Glorieta", // Roundabout
//                    "Cruce de tranvía", // Tram crossing
//                    "Carretera resbaladiza", // Slippery road
//                    "Zona de obras", // Roadworks
//                    "Desprendimiento" // Falling rocks
//                ],
//                sectionName: "Señales de Advertencia de Peligro", // Warning of Danger
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Bajada con fuerte pendiente", // Steep descent
//                description: "Peligro por la existencia de un tramo de vía con fuerte pendiente descendente. La cifra indica la inclinación de la pendiente en porcentaje.", // Warns of a steep downhill section.
//                images: ["P16a"],
//                wrongAnswers: [
//                    "Subida con fuerte pendiente", // Steep ascent
//                    "Curva peligrosa", // Dangerous curve
//                    "Resalto", // Speed bump
//                    "Perfil irregular", // Uneven surface
//                    "Puente móvil", // Movable bridge
//                    "Desprendimientos", // Falling rocks
//                    "Carretera resbaladiza", // Slippery road
//                    "Animales en libertad" // Wild animals
//                ],
//                sectionName: "Señales de Advertencia de Peligro", // Warning of Danger
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Subida con fuerte pendiente", // Steep ascent
//                description: "APeligro por la existencia de un tramo de vía con fuerte pendiente ascendente. La cifra indica la inclinación de la pendiente en porcentaje.", // Warns of a steep uphill section.
//                images: ["P16b"],
//                wrongAnswers: [
//                    "Bajada con fuerte pendiente", // Steep descent
//                    "Curva peligrosa", // Dangerous curve
//                    "Resalto", // Speed bump
//                    "Perfil irregular", // Uneven surface
//                    "Puente móvil", // Movable bridge
//                    "Desprendimientos", // Falling rocks
//                    "Carretera resbaladiza", // Slippery road
//                    "Animales domésticos" // Domestic animals
//                ],
//                sectionName: "Señales de Advertencia de Peligro", // Warning of Danger
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Estrechamiento de calzada", // Road narrowing
//                description: "Peligro por la proximidad de una zona en la que la calzada se estrecha. Puede producirse por ambos lados, por la derecha o por la izquierda, según la variante. También puede usarse cuando se reduzca la anchura de los arcenes.",
//                // Warns of an approaching section where the road narrows — either on both sides, on the right, or on the left, depending on the variant. May also be used when the shoulders narrow.
//                images: ["P17", "P17a", "P17b"],
//                wrongAnswers: [
//                    "Puente estrecho", // Narrow bridge
//                    "Calzada irregular", // Uneven surface
//                    "Curva peligrosa", // Dangerous curve
//                    "Desprendimiento", // Falling rocks
//                    "Carretera resbaladiza", // Slippery road
//                    "Resalto", // Speed bump
//                    "Zona de obras", // Roadworks
//                    "Obras en la calzada" // Roadworks ahead
//                ],
//                sectionName: "Señales de Advertencia de Peligro", // Warning of Danger
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Obras", // Roadworks
//                description: "Peligro por la proximidad de un tramo de vía en obras.",
//                // Danger due to the proximity of a road section under construction.
//                images: ["P18"],
//                wrongAnswers: [
//                    "Resalto", // Speed bump
//                    "Perfil irregular", // Uneven surface
//                    "Carretera resbaladiza", // Slippery road
//                    "Proyección de gravilla", // Loose gravel projection
//                    "Curva peligrosa", // Dangerous curve
//                    "Puente móvil", // Movable bridge
//                    "Animales en libertad", // Wild animals
//                    "Cruce de tranvía" // Tram crossing
//                ],
//                sectionName: "Señales de Advertencia de Peligro", // Warning of Danger
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Pavimento deslizante", // Slippery road
//                description: "Peligro por la proximidad de una zona de la calzada cuyo pavimento puede resultar deslizante.",
//                // Warns of a slippery surface on the road.
//                images: ["P19"],
//                wrongAnswers: [
//                    "Resalto", // Speed bump
//                    "Perfil irregular", // Uneven surface
//                    "Proyección de gravilla", // Loose gravel projection
//                    "Curva peligrosa", // Dangerous curve
//                    "Animales en libertad", // Wild animals
//                    "Puente móvil", // Movable bridge
//                    "Cruce de tranvía", // Tram crossing
//                    "Visibilidad reducida" // Reduced visibility
//                ],
//                sectionName: "Señales de Advertencia de Peligro", // Warning of Danger
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Peatones",
//                description: "Advierte de la proximidad de un paso de peatones.",
//                // Warns of the proximity of a pedestrian crossing.
//                images: ["P20a", "P20b"], // Grouped
//                wrongAnswers: [
//                    "Ciclistas", // Cyclists
//                    "Niños", // Children
//                    "Animales domésticos", // Domestic animals
//                    "Animales en libertad", // Wild animals
//                    "Carretera resbaladiza", // Slippery road
//                    "Curva peligrosa", // Dangerous curve
//                    "Obras" // Roadworks
//                ],
//                sectionName: "Señales de Advertencia de Peligro", // Warning of Danger
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Paso para peatones y ciclistas", // Shared pedestrian and cyclist crossing
//                description: "Advierte de la proximidad de un paso compartido para peatones y ciclistas.",
//                // Warns of the proximity of a shared crossing for pedestrians and cyclists.
//                images: ["P20c"],
//                wrongAnswers: [
//                    "Niños", // Children
//                    "Animales en libertad", // Wild animals
//                    "Curva peligrosa", // Dangerous curve
//                    "Carretera resbaladiza", // Slippery road
//                    "Cruce de tranvía", // Tram crossing
//                    "Resalto" // Speed bump
//                ],
//                sectionName: "Señales de Advertencia de Peligro", // Warning of Danger
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Niños", // Children
//                description: "Peligro por la proximidad de un lugar frecuentado por niños, como una escuela, una zona de juegos, etc.",
//                // Warns of the proximity of school or play areas frequented by children.
//                images: ["P21a"],
//                wrongAnswers: [
//                    "Paso de peatones", // Pedestrian crossing
//                    "Personas con dificultades motrices", // People with mobility difficulties
//                    "Ciclistas", // Cyclists
//                    "Animales domésticos", // Domestic animals
//                    "Animales en libertad", // Wild animals
//                    "Curva peligrosa", // Dangerous curve
//                    "Resalto", // Speed bump
//                    "Carretera resbaladiza" // Slippery road
//                ],
//                sectionName: "Señales de Advertencia de Peligro", // Warning of Danger
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Ancianos", // Elderly people
//                description: """
//Advierte de la proximidad de un lugar frecuentado por personas de edad avanzada, que pueden tener movilidad reducida o menor capacidad de reacción. Es habitual cerca de residencias, centros de día o zonas urbanas con alta presencia de ancianos.
//""" // Warns of the proximity of a place frequented by elderly people, who may have reduced mobility or slower reaction times. Common near retirement homes, day centers, or urban areas with a high presence of elderly pedestrians.
//                ,
//                images: ["P21b"],
//                wrongAnswers: [
//                    "Niños", // Children
//                    "Paso de peatones", // Pedestrian crossing
//                    "Ciclistas", // Cyclists
//                    "Animales domésticos", // Domestic animals
//                    "Animales en libertad", // Wild animals
//                    "Curva peligrosa", // Dangerous curve
//                    "Obras", // Roadworks
//                    "Resalto" // Speed bump
//                ],
//                sectionName: "Señales de Advertencia de Peligro", // Warning of Danger
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Ciclistas", // Cyclists
//                description: """
//Peligro por la proximidad de un tramo con circulación frecuente de ciclistas.
//""",
//                // Warns of the possible presence of cyclists on the road or near a cyclist crossing. Drivers should slow down and take extra care in areas where cyclists may join or cross the roadway.
//                images: ["P22", "P22a"], // Both cyclist warning variants
//                wrongAnswers: [
//                    "Paso de peatones", // Pedestrian crossing
//                    "Niños", // Children
//                    "Animales domésticos", // Domestic animals
//                    "Animales en libertad", // Wild animals
//                    "Curva peligrosa", // Dangerous curve
//                    "Resalto", // Speed bump
//                    "Carretera resbaladiza", // Slippery road
//                    "Obras" // Roadworks
//                ],
//                sectionName: "Señales de Advertencia de Peligro", // Warning of Danger
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Paso de animales domésticos", // Domestic animals crossing
//                description: """
//Peligro por la proximidad de un lugar donde frecuentemente la vía puede ser atravesada por animales domésticos o ganado.
//""" ,
//                images: ["P23"],
//                wrongAnswers: [
//                    "Cruce de tranvía", // Tram crossing
//                    "Resalto", // Speed bump
//                    "Visibilidad reducida", // Reduced visibility
//                    "Zona de obras", // Roadworks
//                    "Carretera resbaladiza", // Slippery road
//                    "Glorieta", // Roundabout
//                    "Puente móvil", // Movable bridge
//                    "Paso de peatones" // Pedestrian crossing
//                ],
//                sectionName: "Señales de Advertencia de Peligro", // Warning of Danger
//                subSectionName: nil
//            ),
//            
//            TrafficSign(
//                title: "Paso de animales en libertad", // Wild animals crossing
//                description: """
//Peligro por la proximidad de un lugar donde frecuentemente la vía puede ser atravesada por animales en libertad.
//""",
//                images: ["P24", "P24a"],
//                wrongAnswers: [
//                    "Cruce de tranvía", // Tram crossing
//                    "Resalto", // Speed bump
//                    "Visibilidad reducida", // Reduced visibility
//                    "Zona de obras", // Roadworks
//                    "Carretera resbaladiza", // Slippery road
//                    "Glorieta", // Roundabout
//                    "Puente móvil", // Movable bridge
//                    "Paso de peatones" // Pedestrian crossing
//                ],
//                sectionName: "Señales de Advertencia de Peligro", // Warning of Danger
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Circulación en los dos sentidos", // Two-way traffic
//                description: "Peligro por la proximidad de un tramo con circulación en ambos sentidos.",
//                // Warns of the beginning of a section of road with traffic in both directions.
//                images: ["P25"],
//                wrongAnswers: [
//                    "Glorieta", // Roundabout
//                    "Cruce de tranvía", // Tram crossing
//                    "Intersección con prioridad", // Intersection with priority
//                    "Curva peligrosa", // Dangerous curve
//                    "Carretera resbaladiza", // Slippery road
//                    "Resalto", // Speed bump
//                    "Animales en libertad", // Wild animals
//                    "Puente móvil" // Movable bridge
//                ],
//                sectionName: "Señales de Advertencia de Peligro", // Warning of Danger
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Desprendimiento", // Falling rocks
//                description: "Peligro por la proximidad a una zona con desprendimientos frecuentes y la consiguiente posible presencia de obstáculos en la calzada.",
//                // Warns of the possible fall of rocks or other materials onto the road.
//                images: ["P26"],
//                wrongAnswers: [
//                    "Resalto", // Speed bump
//                    "Perfil irregular", // Uneven surface
//                    "Carretera resbaladiza", // Slippery road
//                    "Animales en libertad", // Wild animals
//                    "Ganado", // Livestock
//                    "Puente móvil", // Movable bridge
//                    "Curva peligrosa", // Dangerous curve
//                    "Cruce de tranvía" // Tram crossing
//                ],
//                sectionName: "Señales de Advertencia de Peligro", // Warning of Danger
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Muelle", // Quay / Dock
//                description: "Peligro debido a que la vía desemboca en un muelle o en una corriente de agua.",
//                // Warns of the proximity of a dock or place where there is a risk of falling into water.
//                images: ["P27"],
//                wrongAnswers: [
//                    "Puente móvil", // Movable bridge
//                    "Desprendimiento", // Falling rocks
//                    "Resalto", // Speed bump
//                    "Perfil irregular", // Uneven surface
//                    "Carretera resbaladiza", // Slippery road
//                    "Curva peligrosa", // Dangerous curve
//                    "Cruce de tranvía", // Tram crossing
//                    "Animales en libertad" // Wild animals
//                ],
//                sectionName: "Señales de Advertencia de Peligro", // Warning of Danger
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Proyección de gravilla", // Loose gravel
//                description: "Peligro por la proximidad de un tramo de vía donde existe el riesgo de que se proyecte gravilla al pasar los vehículos.",
//                // Warns of the possible presence of loose gravel on the road that may be thrown up while driving.
//                images: ["P28"],
//                wrongAnswers: [
//                    "Carretera resbaladiza", // Slippery road
//                    "Resalto", // Speed bump
//                    "Perfil irregular", // Uneven surface
//                    "Curva peligrosa", // Dangerous curve
//                    "Animales en libertad", // Wild animals
//                    "Puente móvil", // Movable bridge
//                    "Cruce de tranvía" // Tram crossing
//                ],
//                sectionName: "Señales de Advertencia de Peligro", // Warning of Danger
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Viento transversal", // Crosswind
//                description: "Peligro por la proximidad de una zona donde sopla frecuentemente viento fuerte en dirección transversal.",
//                // Warns of the danger of possible strong crosswinds on the road.
//                images: ["P29"],
//                wrongAnswers: [
//                    "Animales en libertad", // Wild animals
//                    "Carretera resbaladiza", // Slippery road
//                    "Curva peligrosa", // Dangerous curve
//                    "Puente móvil", // Movable bridge
//                    "Resalto", // Speed bump
//                    "Proyección de gravilla", // Loose gravel
//                    "Desprendimiento", // Falling rocks
//                    "Glorieta" // Roundabout
//                ],
//                sectionName: "Señales de Advertencia de Peligro", // Warning of Danger
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Escalón lateral", // Side drop
//                description: "Peligro por la existencia de un desnivel a lo largo de la vía en el lado que indique el símbolo.",
//                // Warns of the danger due to a side drop or uneven level at the edge of the road.
//                images: ["P30"],
//                wrongAnswers: [
//                    "Resalto", // Speed bump
//                    "Carretera resbaladiza", // Slippery road
//                    "Proyección de gravilla", // Loose gravel
//                    "Desprendimiento", // Falling rocks
//                    "Curva peligrosa", // Dangerous curve
//                    "Puente móvil", // Movable bridge
//                    "Viento transversal" // Crosswind
//                ],
//                sectionName: "Señales de Advertencia de Peligro", // Warning of Danger
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Congestión", // Traffic congestion
//                description: "Peligro por la proximidad de un tramo en el que frecuentemente la circulación se encuentra detenida o dificultada por congestión del tráfico.",
//                images: ["P31"],
//                wrongAnswers: [
//                    "Glorieta", // Roundabout
//                    "Intersección con prioridad", // Intersection with priority
//                    "Carretera resbaladiza", // Slippery road
//                    "Curva peligrosa", // Dangerous curve
//                    "Resalto", // Speed bump
//                    "Proyección de gravilla", // Loose gravel
//                    "Desprendimiento", // Falling rocks
//                    "Viento transversal" // Crosswind
//                ],
//                sectionName: "Señales de Advertencia de Peligro", // Warning of Danger
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Obstrucción en la calzada", // Obstruction on the road
//                description: "Peligro por la proximidad de un lugar en que hay vehículos que obstruyen la calzada debido a avería, accidente u otras causas.",
//                // Warns of danger due to an obstruction on the road, such as obstacles or temporary narrowing.
//                images: ["P32"],
//                wrongAnswers: [
//                    "Congestión", // Traffic congestion
//                    "Escalón lateral", // Side drop
//                    "Resalto", // Speed bump
//                    "Carretera resbaladiza", // Slippery road
//                    "Curva peligrosa", // Dangerous curve
//                    "Proyección de gravilla", // Loose gravel
//                    "Desprendimiento", // Falling rocks
//                    "Viento transversal" // Crosswind
//                ],
//                sectionName: "Señales de Advertencia de Peligro", // Warning of Danger
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Visibilidad reducida", // Reduced visibility
//                description: "Peligro por la proximidad de un tramo en el que frecuentemente la circulación se ve dificultada por una pérdida notable de visibilidad debida a niebla, lluvia, nieve, humos, etc.",
//                // Warns of danger due to reduced visibility ahead, caused by fog, smoke, or dust. Sign in accordance with the draft Royal Decree modifying the General Traffic Regulations.
//                images: ["P33"],
//                wrongAnswers: [
//                    "Congestión", // Traffic congestion
//                    "Obstrucción en la calzada", // Obstruction on the road
//                    "Escalón lateral", // Side drop
//                    "Carretera resbaladiza", // Slippery road
//                    "Curva peligrosa", // Dangerous curve
//                    "Proyección de gravilla", // Loose gravel
//                    "Desprendimiento", // Falling rocks
//                    "Viento transversal" // Crosswind
//                ],
//                sectionName: "Señales de Advertencia de Peligro", // Warning of Danger
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Pavimento deslizante por hielo o nieve", // Slippery road due to ice or snow
//                description: "Peligro por la proximidad de un tramo en el que frecuentemente, durante la época invernal, hay presencia de hielo o nieve y los consiguientes peligros asociados.",
//                // Warns of danger due to a road section with slippery pavement caused by ice or snow.
//                images: ["P34"],
//                wrongAnswers: [
//                    "Carretera inundada", // Flooded road
//                    "Proyección de gravilla", // Loose gravel
//                    "Escalón lateral", // Side drop
//                    "Visibilidad reducida", // Reduced visibility
//                    "Curva peligrosa", // Dangerous curve
//                    "Desprendimiento", // Falling rocks
//                    "Congestión", // Traffic congestion
//                    "Obras" // Roadworks
//                ],
//                sectionName: "Señales de Advertencia de Peligro", // Warning of Danger
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Cruce trenzado", // Weaving section
//                description: "Advierte de la proximidad de un tramo de vía donde existen trenzados de tráfico, con movimientos de incorporación y salida que requieren especial precaución.",
//                // Warns of an upcoming road section with weaving traffic, where merging and exiting maneuvers require special caution.
//                images: ["P35"],
//                wrongAnswers: [
//                    "Intersección con prioridad", // Intersection with priority
//                    "Circulación en doble sentido", // Two-way traffic
//                    "Curva peligrosa", // Dangerous curve
//                    "Resalto", // Speed bump
//                    "Escalón lateral", // Side drop
//                    "Viento transversal", // Crosswind
//                    "Desprendimiento", // Falling rocks
//                    "Obstrucción en la calzada" // Obstruction on the road
//                ],
//                sectionName: "Señales de Advertencia de Peligro", // Warning of Danger
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Otros peligros", // Other warning sign
//                description: "Indica la proximidad de un peligro distinto de los advertidos por otras señales.",
//                // Generic sign used to warn of other hazards not covered by specific signs.
//                images: ["P50"],
//                wrongAnswers: [
//                    "Visibilidad reducida", // Reduced visibility
//                    "Congestión", // Traffic congestion
//                    "Obstrucción en la calzada", // Obstruction on the road
//                    "Viento transversal", // Crosswind
//                    "Escalón lateral", // Side drop
//                    "Desprendimiento", // Falling rocks
//                    "Proyección de gravilla", // Loose gravel
//                    "Animales en libertad" // Wild animals
//                ],
//                sectionName: "Señales de Advertencia de Peligro", // Warning of Danger
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Peligro por proximidad de señal de STOP", // Danger: approaching STOP sign
//                description: "Advierte de la proximidad de una señal de STOP situada más adelante, normalmente a 150 metros.",
//                // Warns of the proximity of a STOP sign ahead, usually 150 meters away.
//                images: ["P60"],
//                wrongAnswers: [
//                    "Semáforos", // Traffic lights
//                    "Intersección con prioridad", // Intersection with priority
//                    "Cruce de tranvía", // Tram crossing
//                    "Glorieta", // Roundabout
//                    "Carretera resbaladiza", // Slippery road
//                    "Resalto", // Speed bump
//                    "Perfil irregular" // Uneven surface
//                ],
//                sectionName: "Señales de Advertencia de Peligro", // Warning of Danger
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Peligro por proximidad de señal de Ceda el Paso", // Danger: approaching yield sign
//                description: "Advierte de la proximidad de una señal de Ceda el Paso situada más adelante, normalmente a 150 metros.",
//                // Warns of the proximity of a yield (give way) sign ahead, usually 150 meters away.
//                images: ["P61"],
//                wrongAnswers: [
//                    "Semáforos", // Traffic lights
//                    "Intersección sin prioridad", // Intersection without priority
//                    "Cruce de tranvía", // Tram crossing
//                    "Glorieta", // Roundabout
//                    "Carretera resbaladiza", // Slippery road
//                    "Resalto", // Speed bump
//                    "Animales en libertad" // Wild animals
//                ],
//                sectionName: "Señales de Advertencia de Peligro", // Warning of Danger
//                subSectionName: nil
//            ),
//        ]
//    )
//    
//    // MARK: - Señales de Reglamentación (Regulatory Signs)
//    static let reglamentacion = TrafficSection(
//        name: "Señales de Reglamentación", // Regulatory Signs
//        description: """
//Las señales de tráfico de prioridad son esenciales para gestionar el derecho de paso, exigiendo a los conductores que cedan el paso a otros vehículos en situaciones específicas. Para destacar su importancia, estas señales presentan formas únicas que las diferencian de otras señales de tráfico.
//
//Al indicar claramente cuándo ceder el paso, contribuyen a evitar colisiones y a mantener la fluidez del tráfico. Comprender y obedecer estas señales es fundamental para garantizar la seguridad vial y prevenir accidentes en cruces e intersecciones.
//""",
//        /*
//         Priority traffic signs are essential for managing the right of way, requiring drivers to yield to other vehicles in specific situations. To highlight their importance, these signs have unique shapes that distinguish them from other traffic signs.
//         
//         By clearly indicating when to yield, they help prevent collisions and maintain smooth traffic flow. Understanding and obeying these signs is crucial for ensuring road safety and avoiding accidents at intersections and crossings.
//         */
//        subSections: [
//            TrafficSubSection(
//                index: 0,
//                name: "Señales de prioridad",
//                description: "Indican el orden de paso en intersecciones y otras situaciones donde varios vehículos coinciden. Ayudan a determinar quién tiene prioridad y quién debe ceder el paso.",
//                signs: [
//                    TrafficSign(
//                        title: "Ceda el paso", // Priority Signs
//                        description: "Obligación para todo conductor de ceder el paso en la próxima intersección a los vehículos que circulen por la vía a la que se aproxime o al carril al que pretende incorporarse.",
//                        images: ["R1"],
//                        wrongAnswers: [
//                            "Fin de prioridad", // End of priority
//                            "Glorieta", // Roundabout
//                            "Semáforos", // Traffic lights
//                            "Resalto", // Speed bump
//                            "Carretera resbaladiza", // Slippery road
//                            "Puente móvil", // Movable bridge
//                            "Cruce de tranvía" // Tram crossing
//                        ],
//                        sectionName: "Señales de Reglamentación", // Regulation
//                        subSectionName: "Señales de Prioridad"
//                    ),
//                    TrafficSign(
//                        title: "Detención obligatoria o stop", // Stop
//                        description: "Obligación para todo conductor de detener su vehículo ante la próxima línea de detención o, si no existe, inmediatamente antes de la intersección, y ceder el paso en ella a los vehículos que circulen por la vía a la que se aproxime. Si, por circunstancias excepcionales, desde el lugar donde se ha efectuado la detención no existe visibilidad suficiente, el conductor deberá detenerse de nuevo en el lugar desde donde tenga visibilidad, sin poner en peligro a ningún usuario de la vía.",
//                        // Mandatory stop at the STOP sign. The driver must come to a complete halt and yield.
//                        images: ["R2"],
//                        wrongAnswers: [
//                            "Intersección con prioridad", // Intersection with priority
//                            "Fin de prioridad", // End of priority
//                            "Glorieta", // Roundabout
//                            "Semáforos", // Traffic lights
//                            "Paso de peatones", // Pedestrian crossing
//                            "Puente móvil", // Movable bridge
//                            "Cruce de tranvía" // Tram crossing
//                        ],
//                        sectionName: "Señales de Reglamentación", // Regulation
//                        subSectionName: "Señales de Prioridad"
//                    ),
//                    TrafficSign(
//                        title: "Calzada con prioridad", // Priority road
//                        description: "Indica a los conductores de los vehículos que circulen por una calzada su prioridad en las intersecciones sobre los vehículos que circulen por otra calzada o procedan de ella.",
//                        // Indicates the start of a road section where vehicles have priority at intersections until otherwise indicated.
//                        images: ["R3"],
//                        wrongAnswers: [
//                            "Stop", // Stop
//                            "Fin de prioridad", // End of priority
//                            "Glorieta", // Roundabout
//                            "Semáforos", // Traffic lights
//                            "Carretera resbaladiza", // Slippery road
//                            "Puente móvil", // Movable bridge
//                            "Cruce de tranvía" // Tram crossing
//                        ],
//                        sectionName: "Señales de Reglamentación", // Regulation
//                        subSectionName: "Señales de Prioridad"
//                    ),
//                    TrafficSign(
//                        title: "Fin de prioridad", // End of priority
//                        description: "Indica la proximidad del lugar en que la calzada por la que se circula pierde su prioridad respecto a otra calzada.",
//                        // Indicates the end of a road section with priority. Beyond this point, general priority rules apply.
//                        images: ["R4"],
//                        wrongAnswers: [
//                            "Ceda el paso", // Yield
//                            "Stop", // Stop
//                            "Carretera con prioridad", // Priority road
//                            "Glorieta", // Roundabout
//                            "Semáforos", // Traffic lights
//                            "Carretera resbaladiza", // Slippery road
//                            "Puente móvil", // Movable bridge
//                            "Cruce de tranvía" // Tram crossing
//                        ],
//                        sectionName: "Señales de Reglamentación", // Regulation
//                        subSectionName: "Señales de Prioridad"
//                    ),
//                    TrafficSign(
//                        title: "Prioridad del sentido contrario", // Oncoming traffic has priority
//                        description: """
//Prohibición de entrada en un paso estrecho mientras no sea posible atravesarlo sin obligar a los vehículos que circulen en sentido contrario a detenerse.
//""",
//                        images: ["R5"],
//                        wrongAnswers: [
//                            "Prioridad respecto al sentido contrario", // Priority over oncoming traffic
//                            "Ceda el paso", // Yield
//                            "Stop", // Stop
//                            "Entrada prohibida", // No entry
//                            "Prohibido adelantar", // No overtaking
//                            "Glorieta", // Roundabout
//                            "Semáforos", // Traffic lights
//                            "Prohibido girar a la izquierda" // No left turn
//                        ],
//                        sectionName: "Señales de Reglamentación", // Regulation
//                        subSectionName: "Señales de Prioridad"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Prioridad respecto al sentido contrario", // Priority over oncoming traffic
//                        description: """
//Indica a los conductores que, en un próximo paso estrecho, tienen prioridad con relación a los vehículos que circulen en sentido contrario.
//""" // Indicates that the driver has priority over oncoming vehicles, which must yield.
//                        ,
//                        images: ["R6"],
//                        wrongAnswers: [
//                            "Prioridad en sentido contrario", // Oncoming traffic has priority
//                            "Stop", // Stop
//                            "Glorieta", // Roundabout
//                            "Semáforos", // Traffic lights
//                            "Prohibido adelantar", // No overtaking
//                            "Prohibido estacionar", // No parking
//                            "Velocidad máxima 50" // Maximum speed 50
//                        ],
//                        sectionName: "Señales de Reglamentación", // Regulation
//                        subSectionName: "Señales de Prioridad"
//                    ),
//                ]
//            ),
//            TrafficSubSection(
//                index: 1,
//                name: "Prohibición de Entrada",
//                description: "Prohíben la entrada a determinados vehículos o a todo tipo de tráfico. Son de forma circular con borde rojo y fondo blanco, indicando acceso restringido.",
//                signs: [
//                    TrafficSign(
//                        title: "Circulación prohibida", // "Entry Prohibition"
//                        description: "Prohíbe la entrada a todo tipo de vehículos en cualquier circunstancia.",
//                        // "Prohibits entry to all kinds of vehicles under any circumstance."
//                        images: ["R100"],
//                        wrongAnswers: [
//                            "Prohibido estacionar", // "No parking"
//                            "Prohibido girar a la izquierda", // "No left turn"
//                            "Prohibido girar a la derecha", // "No right turn"
//                            "Prohibido adelantar", // "No overtaking"
//                            "Prohibido peatones", // "No pedestrians"
//                            "Ceda el paso", // "Yield"
//                            "Stop" // "Stop"
//                        ],
//                        sectionName: "Señales de Reglamentación", // "Regulatory Signs"
//                        subSectionName: "Prohibición de Entrada"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Entrada prohibida", // "No entry"
//                        description: "Prohíbe la entrada de vehículos en un tramo concreto de la vía, indicado por esta señal.",
//                        // "Prohibits vehicle entry on a specific section of road indicated by this sign."
//                        images: ["R101"],
//                        wrongAnswers: [
//                            "Prohibido estacionar", // "No parking"
//                            "Prohibido adelantar", // "No overtaking"
//                            "Prohibido girar a la izquierda", // "No left turn"
//                            "Prohibido girar a la derecha", // "No right turn"
//                            "Ceda el paso", // "Yield"
//                            "Stop", // "Stop"
//                            "Prohibido peatones" // "No pedestrians"
//                        ],
//                        sectionName: "Señales de Reglamentación", // "Regulatory Signs"
//                        subSectionName: "Prohibición de Entrada"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Entrada prohibida a vehículos de motor", // "No motor vehicles"
//                        description: "Prohíbe la entrada a todos los vehículos de motor, incluidos automóviles y motocicletas.",
//                        // "Prohibits entry for all motor vehicles, including cars and motorcycles."
//                        images: ["R102"],
//                        wrongAnswers: [
//                            "Prohibido adelantar", // "No overtaking"
//                            "Prohibido estacionar", // "No parking"
//                            "Prohibido girar a la izquierda", // "No left turn"
//                            "Prohibido girar a la derecha", // "No right turn"
//                            "Prohibido peatones", // "No pedestrians"
//                            "Ceda el paso", // "Yield"
//                            "Stop" // "Stop"
//                        ],
//                        sectionName: "Señales de Reglamentación", // "Regulatory Signs"
//                        subSectionName: "Prohibición de Entrada"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Entrada prohibida a vehículos de motor, excepto motocicletas", // "No motor vehicles except motorcycles"
//                        description: "Prohíbe la entrada a vehículos de motor, excepto motocicletas.",
//                        // "Prohibits entry for motor vehicles except motorcycles."
//                        images: ["R103"],
//                        wrongAnswers: [
//                            "Prohibido peatones", // "No pedestrians"
//                            "Prohibido estacionar", // "No parking"
//                            "Prohibido adelantar", // "No overtaking"
//                            "Prohibido girar a la derecha", // "No right turn"
//                            "Ceda el paso", // "Yield"
//                            "Stop", // "Stop"
//                            "Entrada prohibida" // "No entry"
//                        ],
//                        sectionName: "Señales de Reglamentación", // "Regulatory Signs"
//                        subSectionName: "Prohibición de Entrada"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Prohibido motocicletas", // "No motorcycles"
//                        description: "Prohíbe la entrada a motocicletas.",
//                        // "Prohibits entry for motorcycles."
//                        images: ["R104"],
//                        wrongAnswers: [
//                            "Prohibido ciclomotores", // "No mopeds"
//                            "Prohibido automóviles", // "No cars"
//                            "Prohibido camiones", // "No trucks"
//                            "Prohibido autobuses", // "No buses"
//                            "Prohibido bicicletas", // "No bicycles"
//                            "Prohibido peatones", // "No pedestrians"
//                            "Ceda el paso", // "Yield"
//                            "Stop" // "Stop"
//                        ],
//                        sectionName: "Señales de Reglamentación", // "Regulatory Signs"
//                        subSectionName: "Prohibición de Entrada"
//                    ),
//                    TrafficSign(
//                        title: "Entrada prohibida a ciclomotores", // "No mopeds"
//                        description: "Prohíbe la entrada a ciclomotores, incluidos los de tres ruedas y los vehículos destinados a personas con movilidad reducida.",
//                        // "Prohibits entry to mopeds, including three-wheeled ones and vehicles for people with reduced mobility."
//                        images: ["R105"],
//                        wrongAnswers: [
//                            "Entrada prohibida a vehículos agrícolas de motor", // "No agricultural motor vehicles"
//                            "Entrada prohibida a vehículos de motor con remolque", // "No motor vehicles with trailers"
//                            "Prohibido camiones de transporte de mercancías", // "No goods transport trucks"
//                            "Entrada prohibida a peatones", // "No pedestrians"
//                            "Prohibido mercancías peligrosas", // "No dangerous goods"
//                            "Calzada reservada para ciclomotores", // "Road reserved for mopeds"
//                            "Entrada prohibida a animales de montura" // "No ridden animals"
//                        ],
//                        sectionName: "Señales de Reglamentación", // "Regulatory Signs"
//                        subSectionName: "Prohibición de Entrada"
//                    ),
//                    TrafficSign(
//                        title: "Entrada prohibida a vehículos destinados al transporte de mercancías", // "No goods vehicles"
//                        description: "Prohíbe la entrada a vehículos destinados al transporte de mercancías, como camiones, furgones o tractocamiones, independientemente de su masa.",
//                        // "Prohibits entry to vehicles intended for the transport of goods, such as trucks, vans, or lorries, regardless of their weight."
//                        images: ["R106"],
//                        wrongAnswers: [
//                            "Entrada prohibida a vehículos con remolque de más de un eje", // "No motor vehicles with trailers (more than one axle)"
//                            "Entrada prohibida a vehículos de motor", // "No motor vehicles"
//                            "Prohibido mercancías peligrosas", // "No dangerous goods"
//                            "Prohibido vehículos agrícolas de motor", // "No agricultural motor vehicles"
//                            "Entrada prohibida a autobuses", // "No buses"
//                            "Calzada reservada para camiones", // "Road reserved for trucks"
//                            "Entrada prohibida a animales de montura" // "No ridden animals"
//                        ],
//                        sectionName: "Señales de Reglamentación", // "Regulatory Signs"
//                        subSectionName: "Prohibición de Entrada"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Entrada prohibida a vehículos de transporte de mercancías con masa superior a la indicada", // "No heavy goods vehicles (over indicated weight)"
//                        description: "Prohíbe la entrada a vehículos de transporte de mercancías cuya masa máxima autorizada supere la indicada en la señal, incluso si circulan vacíos.",
//                        // "Prohibits entry to goods vehicles whose maximum authorized mass exceeds the value shown, even when empty."
//                        images: ["R107"],
//                        wrongAnswers: [
//                            "Prohibido mercancías explosivas o inflamables", // "No explosive or flammable goods"
//                            "Entrada prohibida a tractores", // "No tractors"
//                            "Entrada prohibida a vehículos de transporte de mercancías", // "No goods vehicles"
//                            "Limitación de altura", // "Height limit"
//                            "Entrada prohibida a vehículos de tracción animal", // "No animal-drawn vehicles"
//                            "Calzada para camiones y furgones" // "Road for trucks and vans"
//                        ],
//                        sectionName: "Señales de Reglamentación", // "Regulatory Signs"
//                        subSectionName: "Prohibición de Entrada"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Entrada prohibida a vehículos que transporten mercancías peligrosas", // "No vehicles carrying dangerous goods"
//                        description: "Prohíbe la entrada a vehículos que transporten mercancías peligrosas que deban estar señalizadas según la normativa específica.",
//                        // "Prohibits entry to vehicles carrying dangerous goods that must be labeled according to specific regulations."
//                        images: ["R108"],
//                        wrongAnswers: [
//                            "Entrada prohibida a vehículos de transporte de mercancías", // "No goods vehicles"
//                            "Entrada prohibida a vehículos con remolque", // "No motor vehicles with trailers"
//                            "Prohibido mercancías contaminantes del agua", // "No water-polluting goods"
//                            "Calzada para vehículos con mercancías peligrosas", // "Road for vehicles with dangerous goods"
//                            "Entrada prohibida general", // "General no entry"
//                            "Prohibido camiones" // "No trucks"
//                        ],
//                        sectionName: "Señales de Reglamentación", // "Regulatory Signs"
//                        subSectionName: "Prohibición de Entrada"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Entrada prohibida a vehículos que transporten mercancías explosivas o inflamables", // "No vehicles carrying explosive or flammable goods"
//                        description: "Prohíbe la entrada a vehículos que transporten mercancías explosivas o inflamables y que deban señalizarse conforme a la normativa vigente.",
//                        // "Prohibits entry to vehicles carrying explosive or flammable goods that must be marked according to regulations."
//                        images: ["R109"],
//                        wrongAnswers: [
//                            "Entrada prohibida a vehículos agrícolas de motor", // "No agricultural vehicles"
//                            "Prohibido mercancías contaminantes del agua", // "No water-polluting goods"
//                            "Entrada prohibida a camiones pesados", // "No heavy trucks"
//                            "Calzada para vehículos con mercancías peligrosas", // "Road for dangerous goods"
//                            "Entrada prohibida a vehículos de transporte de mercancías", // "No goods transport vehicles"
//                            "Entrada prohibida general" // "General no entry"
//                        ],
//                        sectionName: "Señales de Reglamentación", // "Regulatory Signs"
//                        subSectionName: "Prohibición de Entrada"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Entrada prohibida a vehículos que transporten productos contaminantes del agua", // "No vehicles carrying water-polluting products"
//                        description: "Prohíbe la entrada a vehículos que transporten más de 1.000 litros de productos capaces de contaminar el agua.",
//                        // "Prohibits entry to vehicles carrying over 1,000 litres of products capable of polluting water."
//                        images: ["R110"],
//                        wrongAnswers: [
//                            "Entrada prohibida a vehículos que transporten mercancías explosivas o inflamables", // "No vehicles carrying explosive or flammable goods"
//                            "Prohibido vehículos de transporte de mercancías pesados", // "No heavy goods vehicles"
//                            "Entrada prohibida a tractores", // "No tractors"
//                            "Calzada para vehículos con productos contaminantes del agua", // "Road for vehicles carrying water-polluting goods"
//                            "Entrada prohibida a automóviles", // "No cars"
//                            "Entrada prohibida a vehículos agrícolas de motor" // "No agricultural vehicles"
//                        ],
//                        sectionName: "Señales de Reglamentación", // "Regulatory Signs"
//                        subSectionName: "Prohibición de Entrada"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Entrada prohibida a vehículos agrícolas de motor", // "No agricultural motor vehicles"
//                        description: "Prohíbe el acceso a tractores y otras máquinas agrícolas autopropulsadas.",
//                        // "Prohibits entry to tractors and other self-propelled agricultural machines."
//                        images: ["R111"],
//                        wrongAnswers: [
//                            "Entrada prohibida a vehículos de tracción animal", // "No animal-drawn vehicles"
//                            "Entrada prohibida a vehículos de transporte de mercancías", // "No goods vehicles"
//                            "Prohibido camiones de gran tonelaje", // "No heavy trucks"
//                            "Prohibido ciclomotores", // "No mopeds"
//                            "Entrada prohibida a motocicletas", // "No motorcycles"
//                            "Prohibido mercancías peligrosas", // "No dangerous goods"
//                            "Entrada prohibida a tractores con remolque" // "No tractors with trailers"
//                        ],
//                        sectionName: "Señales de Reglamentación", // "Regulatory Signs"
//                        subSectionName: "Prohibición de Entrada"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Entrada prohibida a vehículos de motor con remolque, excepto los de un solo eje", // "No motor vehicles with trailers except single-axle"
//                        description: "Prohíbe la entrada a vehículos de motor con remolque, excepto los de un solo eje. Si se indica una cifra de tonelaje, la prohibición se aplica solo cuando el remolque supera dicha masa máxima autorizada.",
//                        // "Prohibits entry to motor vehicles with trailers, except those with a single axle. If a weight figure is shown, it applies only when the trailer exceeds that mass."
//                        images: ["R112"],
//                        wrongAnswers: [
//                            "Prohibido camiones de transporte de mercancías", // "No goods transport trucks"
//                            "Entrada prohibida a vehículos agrícolas de motor", // "No agricultural vehicles"
//                            "Prohibido mercancías peligrosas", // "No dangerous goods"
//                            "Limitación de masa total", // "Maximum total weight limit"
//                            "Entrada prohibida general" // "General no entry"
//                        ],
//                        sectionName: "Señales de Reglamentación", // "Regulatory Signs"
//                        subSectionName: "Prohibición de Entrada"
//                    ),
//                    TrafficSign(
//                        title: "Entrada prohibida a vehículos de tracción animal", // "No animal-drawn vehicles"
//                        description: "Prohíbe el acceso a vehículos de tracción animal, como carros o carruajes tirados por caballos u otros animales.",
//                        // "Prohibits access to animal-drawn vehicles, such as carts or carriages pulled by horses or other animals."
//                        images: ["R113"],
//                        wrongAnswers: [
//                            "Entrada prohibida a vehículos agrícolas de motor", // "No agricultural vehicles"
//                            "Entrada prohibida a ciclomotores", // "No mopeds"
//                            "Entrada prohibida a animales de montura", // "No ridden animals"
//                            "Entrada prohibida a camiones", // "No trucks"
//                            "Entrada prohibida a peatones", // "No pedestrians"
//                            "Prohibido mercancías peligrosas", // "No dangerous goods"
//                            "Calzada para vehículos de tracción animal" // "Road for animal-drawn vehicles"
//                        ],
//                        sectionName: "Señales de Reglamentación", // "Regulatory Signs"
//                        subSectionName: "Prohibición de Entrada"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Entrada prohibida a ciclos", // "No cycles"
//                        description: "Prohíbe la entrada a ciclos, incluidas bicicletas y triciclos.",
//                        // "Prohibits entry to cycles, including bicycles and tricycles."
//                        images: ["R114"],
//                        wrongAnswers: [
//                            "Entrada prohibida a vehículos de movilidad personal", // "No personal mobility vehicles"
//                            "Entrada prohibida a motocicletas", // "No motorcycles"
//                            "Prohibido ciclomotores", // "No mopeds"
//                            "Prohibido peatones", // "No pedestrians"
//                            "Entrada prohibida a vehículos de tracción animal", // "No animal-drawn vehicles"
//                            "Prohibido animales de montura", // "No ridden animals"
//                            "Vía obligatoria para bicicletas" // "Mandatory lane for bicycles"
//                        ],
//                        sectionName: "Señales de Reglamentación", // "Regulatory Signs"
//                        subSectionName: "Prohibición de Entrada"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Entrada prohibida a carros de mano", // "No handcarts"
//                        description: "Prohíbe el acceso a carros de mano o vehículos impulsados manualmente por personas.",
//                        // "Prohibits access to handcarts or manually pushed vehicles."
//                        images: ["R115"],
//                        wrongAnswers: [
//                            "Entrada prohibida a peatones", // "No pedestrians"
//                            "Entrada prohibida a bicicletas", // "No bicycles"
//                            "Entrada prohibida a animales de montura", // "No ridden animals"
//                            "Prohibido ciclomotores", // "No mopeds"
//                            "Entrada prohibida a vehículos agrícolas", // "No agricultural vehicles"
//                            "Entrada prohibida general", // "General no entry"
//                            "Prohibido vehículos de motor" // "No motor vehicles"
//                        ],
//                        sectionName: "Señales de Reglamentación", // "Regulatory Signs"
//                        subSectionName: "Prohibición de Entrada"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Entrada prohibida a peatones", // "No pedestrians"
//                        description: "Prohíbe el acceso a personas que circulen a pie en la vía o zona señalizada.",
//                        // "Prohibits access for pedestrians on the indicated road or area."
//                        images: ["R116"],
//                        wrongAnswers: [
//                            "Entrada prohibida a bicicletas", // "No bicycles"
//                            "Entrada prohibida a vehículos de movilidad personal", // "No personal mobility vehicles"
//                            "Prohibido animales de montura", // "No ridden animals"
//                            "Entrada prohibida a ciclomotores", // "No mopeds"
//                            "Calzada para peatones", // "Road reserved for pedestrians"
//                            "Entrada prohibida a vehículos agrícolas de motor", // "No agricultural vehicles"
//                            "Entrada prohibida general" // "General no entry"
//                        ],
//                        sectionName: "Señales de Reglamentación", // "Regulatory Signs"
//                        subSectionName: "Prohibición de Entrada"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Entrada prohibida a animales de montura", // "No ridden animals"
//                        description: "Prohíbe la entrada a animales destinados a la monta, como caballos con jinete.",
//                        // "Prohibits entry to ridden animals, such as horses with riders."
//                        images: ["R117"],
//                        wrongAnswers: [
//                            "Entrada prohibida a vehículos de tracción animal", // "No animal-drawn vehicles"
//                            "Entrada prohibida a ciclomotores", // "No mopeds"
//                            "Entrada prohibida a bicicletas", // "No bicycles"
//                            "Prohibido peatones", // "No pedestrians"
//                            "Calzada para animales de montura", // "Road reserved for ridden animals"
//                            "Entrada prohibida a vehículos agrícolas de motor", // "No agricultural motor vehicles"
//                            "Entrada prohibida general" // "General no entry"
//                        ],
//                        sectionName: "Señales de Reglamentación", // "Regulatory Signs"
//                        subSectionName: "Prohibición de Entrada"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Entrada prohibida a vehículos de movilidad personal", // "No personal mobility vehicles"
//                        description: "Prohíbe la entrada a vehículos de movilidad personal, como patinetes eléctricos u otros VMP.",
//                        // "Prohibits entry to personal mobility vehicles, such as electric scooters or similar devices."
//                        images: ["R118"],
//                        wrongAnswers: [
//                            "Entrada prohibida a bicicletas", // "No bicycles"
//                            "Entrada prohibida a ciclomotores", // "No mopeds"
//                            "Entrada prohibida a peatones", // "No pedestrians"
//                            "Entrada prohibida a animales de montura", // "No ridden animals"
//                            "Vía obligatoria para vehículos de movilidad personal", // "Mandatory lane for personal mobility vehicles"
//                            "Entrada prohibida a motocicletas", // "No motorcycles"
//                            "Entrada prohibida general" // "General no entry"
//                        ],
//                        sectionName: "Señales de Reglamentación", // "Regulatory Signs"
//                        subSectionName: "Prohibición de Entrada"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Entrada prohibida a ciclos y vehículos de movilidad personal", // "No bicycles or personal mobility vehicles"
//                        description: "Prohíbe la entrada a ciclos, incluidas bicicletas, y a vehículos de movilidad personal como patinetes eléctricos.",
//                        // "Prohibits entry to cycles (including bicycles) and personal mobility vehicles such as electric scooters."
//                        images: ["R119"],
//                        wrongAnswers: [
//                            "Entrada prohibida a peatones", // "No pedestrians"
//                            "Entrada prohibida a ciclomotores", // "No mopeds"
//                            "Entrada prohibida a motocicletas", // "No motorcycles"
//                            "Entrada prohibida a animales de montura", // "No ridden animals"
//                            "Calzada reservada para bicicletas y vehículos de movilidad personal", // "Road reserved for bicycles and mobility vehicles"
//                            "Prohibido vehículos de motor", // "No motor vehicles"
//                            "Entrada prohibida general" // "General no entry"
//                        ],
//                        sectionName: "Señales de Reglamentación", // "Regulatory Signs"
//                        subSectionName: "Prohibición de Entrada"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Entrada prohibida a vehículos según distintivo ambiental", // "No entry according to environmental label"
//                        description: "Prohíbe la entrada a determinados vehículos en función de su distintivo ambiental o de otros criterios ecológicos establecidos.",
//                        // "Prohibits entry to certain vehicles based on their environmental label or other defined environmental criteria."
//                        images: ["R120"],
//                        wrongAnswers: [
//                            "Entrada prohibida a vehículos de motor", // "No motor vehicles"
//                            "Entrada prohibida a motocicletas", // "No motorcycles"
//                            "Entrada prohibida a ciclomotores", // "No mopeds"
//                            "Zona de bajas emisiones", // "Low emission zone"
//                            "Entrada prohibida a vehículos de mercancías peligrosas", // "No vehicles carrying dangerous goods"
//                            "Prohibido mercancías explosivas o inflamables", // "No explosive or flammable goods"
//                            "Entrada prohibida general" // "General no entry"
//                        ],
//                        sectionName: "Señales de Reglamentación", // "Regulatory Signs"
//                        subSectionName: "Prohibición de Entrada"
//                    ),
//                ]
//            ),
//            TrafficSubSection(
//                index: 2,
//                name: "Restricción de Paso",
//                description: "Limita el paso de vehículos según su tipo, tamaño, peso o carga. Son circulares con borde rojo y fondo blanco, indicando una restricción específica.",
//                signs: [
//                    TrafficSign(
//                        title: "Prohibición de pasar sin detenerse", // Passage Restriction
//                        description: "Indica el lugar donde es obligatoria la detención por la proximidad, según la inscripción que contenga, de un puesto de aduana, de policía, de peaje u otro, tras los cuales pueden estar instalados medios mecánicos de detención. En todo caso, el conductor así detenido no podrá reanudar su marcha hasta haber cumplido la prescripción que la señal establece.",
//                        // Requires all vehicles to stop at the indicated checkpoint (customs, toll, police, etc.) before proceeding.
//                        images: ["R200"],
//                        wrongAnswers: [
//                            "Stop", // Stop
//                            "Ceda el paso", // Yield
//                            "Entrada prohibida", // No entry
//                            "Prohibido el paso a vehículos de motor", // No entry for motor vehicles
//                            "Prohibido peatones", // No pedestrians
//                            "Prohibido ciclomotores", // No mopeds
//                            "Velocidad máxima 50", // Maximum speed 50
//                            "Prohibido estacionar" // No parking
//                        ],
//                        sectionName: "Señales de Reglamentación", // Regulation
//                        subSectionName: "Restricción de Paso"
//                    ),
//                    TrafficSign(
//                        title: "Peaje", // Toll
//                        description: "Indica la obligación de detenerse en un peaje para efectuar el pago correspondiente antes de continuar.",
//                        // Indicates the obligation to stop at a toll to make the required payment before continuing.
//                        images: ["R200a", "R200b", "R200c"],
//                        wrongAnswers: [
//                            "Stop", // Stop
//                            "Ceda el paso", // Yield
//                            "Entrada prohibida", // No entry
//                            "Prohibido pasar sin detenerse", // No passing without stopping
//                            "Prohibido estacionar", // No parking
//                            "Prohibido peatones", // No pedestrians
//                            "Prohibido vehículos de motor", // No motor vehicles
//                            "Velocidad máxima 50" // Maximum speed 50
//                        ],
//                        sectionName: "Señales de Reglamentación", // Regulation
//                        subSectionName: "Restricción de Paso"
//                    ),
//                    TrafficSign(
//                        title: "Aduana", // Customs
//                        description: "Indica la obligación de detenerse en un control aduanero para inspección antes de continuar.",
//                        // Indicates the obligation to stop at a customs control for inspection before proceeding.
//                        images: ["R201"],
//                        wrongAnswers: [
//                            "Peaje", // Toll
//                            "Prohibido pasar sin detenerse", // No passing without stopping
//                            "Entrada prohibida", // No entry
//                            "Stop", // Stop
//                            "Ceda el paso", // Yield
//                            "Prohibido vehículos de motor", // No motor vehicles
//                            "Prohibido estacionar", // No parking
//                            "Velocidad máxima 50" // Maximum speed 50
//                        ],
//                        sectionName: "Señales de Reglamentación", // Regulation
//                        subSectionName: "Restricción de Paso"
//                    ),
//                    TrafficSign(
//                        title: "Control policial", // Police control
//                        description: "Señal utilizada por la Policía Nacional o la Guardia Civil durante controles de carretera. Normalmente se instala sobre un trípode portátil en el asfalto e indica la obligación de detenerse cuando lo ordenen los agentes.",
//                        // Sign used by the National Police or Civil Guard during road controls. Usually placed on a portable tripod and indicates the obligation to stop when ordered by officers.
//                        images: ["R202"],
//                        wrongAnswers: [
//                            "Aduana", // Customs
//                            "Peaje", // Toll
//                            "Stop", // Stop
//                            "Ceda el paso", // Yield
//                            "Prohibido pasar sin detenerse", // No passing without stopping
//                            "Entrada prohibida", // No entry
//                            "Prohibido vehículos de motor", // No motor vehicles
//                            "Prohibido estacionar" // No parking
//                        ],
//                        sectionName: "Señales de Reglamentación", // Regulation
//                        subSectionName: "Restricción de Paso"
//                    ),
//                    TrafficSign(
//                        title: "Limitación de masa", // Maximum total weight limit
//                        description: "Prohíbe la entrada a vehículos cuyo peso total autorizado supere el límite indicado en la señal (5.5, 10 o 16 toneladas, según la variante).",
//                        // Prohibits entry for vehicles whose total authorized weight exceeds the indicated limit (5, 5.5, or 10 tons depending on the version).
//                        images: ["R203b", "R203c", "R203d"],
//                        wrongAnswers: [
//                            "Límite de carga por eje", // Axle load limit
//                            "Prohibido camiones", // No trucks
//                            "Prohibido mercancías peligrosas", // No dangerous goods
//                            "Entrada prohibida", // No entry
//                            "Prohibido autobuses", // No buses
//                            "Prohibido automóviles", // No cars
//                            "Prohibido motocicletas", // No motorcycles
//                            "Prohibido ciclomotores" // No mopeds
//                        ],
//                        sectionName: "Señales de Reglamentación", // Regulation
//                        subSectionName: "Restricción de Paso"
//                    ),
//                    TrafficSign(
//                        title: "Limitación de masa por eje", // Axle load limit
//                        description: "Prohíbe la entrada a vehículos cuya carga por eje supere el límite indicado en la señal.",
//                        // Prohibits entry for vehicles whose axle load exceeds the indicated limit.
//                        images: ["R204"],
//                        wrongAnswers: [
//                            "Límite de peso total autorizado", // Maximum total weight limit
//                            "Prohibido camiones", // No trucks
//                            "Prohibido mercancías peligrosas", // No dangerous goods
//                            "Entrada prohibida", // No entry
//                            "Prohibido autobuses", // No buses
//                            "Prohibido automóviles", // No cars
//                            "Prohibido motocicletas", // No motorcycles
//                            "Prohibido ciclomotores" // No mopeds
//                        ],
//                        sectionName: "Señales de Reglamentación", // Regulation
//                        subSectionName: "Restricción de Paso"
//                    ),
//                    TrafficSign(
//                        title: "Limitación de longitud", // Length limit
//                        description: "Prohíbe la entrada a vehículos o conjuntos de vehículos cuya longitud total supere la indicada en la señal.",
//                        // Prohibits entry to vehicles or combinations whose total length exceeds that indicated on the sign.
//                        images: ["R205"],
//                        wrongAnswers: [
//                            "Límite de altura", // Height limit
//                            "Límite de anchura", // Width limit
//                            "Límite de peso total autorizado", // Maximum total weight limit
//                            "Límite de carga por eje", // Axle load limit
//                            "Prohibido camiones", // No trucks
//                            "Prohibido autobuses", // No buses
//                            "Prohibido automóviles", // No cars
//                            "Entrada prohibida" // No entry
//                        ],
//                        sectionName: "Señales de Reglamentación", // Regulation
//                        subSectionName: "Restricción de Paso"
//                    ),
//                    TrafficSign(
//                        title: "Limitación de anchura", // Width limit
//                        description: "Prohíbe la entrada a vehículos cuya anchura total supere la indicada en la señal.",
//                        // Prohibits entry to vehicles whose total width exceeds that indicated on the sign.
//                        images: ["R206a", "R206b"],
//                        wrongAnswers: [
//                            "Límite de altura", // Height limit
//                            "Limitación de longitud", // Length limit
//                            "Límite de peso total autorizado", // Maximum total weight limit
//                            "Límite de carga por eje", // Axle load limit
//                            "Prohibido camiones", // No trucks
//                            "Prohibido autobuses", // No buses
//                            "Prohibido automóviles", // No cars
//                            "Entrada prohibida" // No entry
//                        ],
//                        sectionName: "Señales de Reglamentación", // Regulation
//                        subSectionName: "Restricción de Paso"
//                    ),
//                    TrafficSign(
//                        title: "Limitación de altura", // Height limit
//                        description: "Prohíbe la entrada a vehículos cuya altura total supere la indicada en la señal.",
//                        // Prohibits entry to vehicles whose total height exceeds that indicated on the sign.
//                        images: ["R207"],
//                        wrongAnswers: [
//                            "Limitación de anchura", // Width limit
//                            "Limitación de longitud", // Length limit
//                            "Límite de peso total autorizado", // Maximum total weight limit
//                            "Límite de carga por eje", // Axle load limit
//                            "Prohibido camiones", // No trucks
//                            "Prohibido autobuses", // No buses
//                            "Prohibido automóviles", // No cars
//                            "Entrada prohibida" // No entry
//                        ],
//                        sectionName: "Señales de Reglamentación", // Regulation
//                        subSectionName: "Restricción de Paso"
//                    ),
//                ]
//            ),
//            TrafficSubSection(
//                index: 3,
//                name: "Prohibición o restricción",
//                description: "Incluyen prohibiciones adicionales como adelantamientos, giros o estacionamientos. Mantienen el diseño circular con borde rojo y fondo blanco.",
//                signs: [
//                    TrafficSign(
//                        title: "Separación mínima",
//                        description: "Prohíbe circular sin mantener con el vehículo precedente una separación igual o mayor a la indicada en la señal, excepto para adelantar. Si no aparece ninguna cifra, recuerda que debe guardarse la distancia de seguridad reglamentaria.",
//                        // Prohibits driving without maintaining the minimum distance from the vehicle ahead, except when overtaking.
//                        images: ["R300a", "R300b"],
//                        wrongAnswers: [
//                            "Prohibido adelantar", // No overtaking
//                            "Velocidad máxima", // Maximum speed
//                            "Distancia mínima obligatoria", // Minimum distance required
//                            "Entrada prohibida", // No entry
//                            "Fin de prohibiciones", // End of restrictions
//                            "Prohibido vehículos de motor" // No motor vehicles
//                        ],
//                        sectionName: "Señales de Reglamentación", // Regulatory Signs
//                        subSectionName: "Prohibición o Restricción"
//                    ),
//                    TrafficSign(
//                        title: "Velocidad máxima", // Maximum speed
//                        description: "Prohíbe circular a una velocidad superior a la indicada en la señal, expresada en kilómetros por hora. La prohibición se mantiene hasta otra señal de «Fin de limitación de velocidad», «Fin de prohibiciones» o una nueva señal de «Velocidad máxima».",
//                        // Prohibits driving faster than the speed indicated on the sign (in km/h). The restriction remains in effect until an end-of-limit or new maximum-speed sign.
//                        images: ["R301a", "R301b", "R301c", "R301d", "R301e", "R301f", "R301g", "R301h", "R301i", "R301j", "R301k", "R301l", "R301m", "R301n"],
//                        wrongAnswers: [
//                            "Velocidad mínima", // Minimum speed
//                            "Distancia mínima obligatoria", // Minimum distance required
//                            "Prohibido adelantar", // No overtaking
//                            "Entrada prohibida", // No entry
//                            "Fin de prohibiciones", // End of restrictions
//                            "Prohibido vehículos de motor" // No motor vehicles
//                        ],
//                        sectionName: "Señales de Reglamentación", // Regulatory Signs
//                        subSectionName: "Prohibición o Restricción"
//                    ),
//                    TrafficSign(
//                        title: "Prohibido girar a la derecha", // No right turn
//                        description: "Prohíbe a los vehículos realizar un giro a la derecha en la intersección indicada.",
//                        // Prohibits vehicles from making a right turn at the indicated intersection.
//                        images: ["R302"],
//                        wrongAnswers: [
//                            "Prohibido girar a la izquierda", // No left turn
//                            "Prohibido cambiar de sentido", // No U-turn
//                            "Prohibido adelantar", // No overtaking
//                            "Entrada prohibida", // No entry
//                            "Ceda el paso", // Yield
//                            "Stop", // Stop
//                            "Prohibido estacionar", // No parking
//                        ],
//                        sectionName: "Señales de Reglamentación", // Regulatory Signs
//                        subSectionName: "Prohibición o Restricción"
//                    ),
//                    TrafficSign(
//                        title: "Prohibido girar a la izquierda", // No left turn
//                        description: "Prohíbe a los vehículos realizar un giro a la izquierda en la intersección indicada.",
//                        // Prohibits vehicles from making a left turn at the indicated intersection.
//                        images: ["R303"],
//                        wrongAnswers: [
//                            "Prohibido girar a la derecha", // No right turn
//                            "Prohibido cambiar de sentido", // No U-turn
//                            "Prohibido adelantar", // No overtaking
//                            "Entrada prohibida", // No entry
//                            "Ceda el paso", // Yield
//                            "Stop", // Stop
//                            "Prohibido estacionar", // No parking
//                        ],
//                        sectionName: "Señales de Reglamentación", // Regulatory Signs
//                        subSectionName: "Prohibición o Restricción"
//                    ),
//                    TrafficSign(
//                        title: "Cambio de sentido prohibido", // No U-turn
//                        description: "Prohíbe realizar la maniobra de cambio de sentido de la marcha.",
//                        // Prohibits performing a U-turn.
//                        images: ["R304"],
//                        wrongAnswers: [
//                            "Prohibido girar a la izquierda", // No left turn
//                            "Prohibido girar a la derecha", // No right turn
//                            "Prohibido adelantar", // No overtaking
//                            "Fin de prohibiciones", // End of restrictions
//                            "Entrada prohibida", // No entry
//                            "Prohibido vehículos de motor" // No motor vehicles
//                        ],
//                        sectionName: "Señales de Reglamentación", // Regulatory Signs
//                        subSectionName: "Prohibición o Restricción"
//                    ),
//                    TrafficSign(
//                        title: "Prohibido adelantar", // No overtaking
//                        description: "Prohíbe a los vehículos adelantar a otros en la vía señalizada.",
//                        // Prohibits vehicles from overtaking others on the indicated road.
//                        images: ["R305"],
//                        wrongAnswers: [
//                            "Prohibido girar a la izquierda", // No left turn
//                            "Prohibido girar a la derecha", // No right turn
//                            "Cambio de sentido prohibido", // No U-turn
//                            "Entrada prohibida", // No entry
//                            "Stop", // Stop
//                            "Ceda el paso", // Yield
//                            "Prohibido estacionar" // No parking
//                        ],
//                        sectionName: "Señales de Reglamentación", // Regulatory Signs
//                        subSectionName: "Prohibición o Restricción"
//                    ),
//                    TrafficSign(
//                        title: "Prohibido adelantar camiones", // No overtaking for trucks
//                        description: "Prohíbe a los vehículos destinados al transporte de mercancías con una masa máxima autorizada superior a 3.500 kg adelantar a otros vehículos.",
//                        // Prohibits goods vehicles over 3,500 kg from overtaking other vehicles.
//                        images: ["R306"],
//                        wrongAnswers: [
//                            "Prohibido vehículos de transporte de mercancías pesados", // No heavy goods vehicles
//                            "Prohibido girar a la izquierda", // No left turn
//                            "Cambio de sentido prohibido", // No U-turn
//                            "Entrada prohibida", // No entry
//                            "Stop", // Stop
//                            "Ceda el paso" // Yield
//                        ],
//                        sectionName: "Señales de Reglamentación", // Regulatory Signs
//                        subSectionName: "Prohibición o Restricción"
//                    ),
//                    TrafficSign(
//                        title: "Parada y estacionamiento prohibido", // No stopping or parking
//                        description: "Prohíbe parar y estacionar en el lado de la calzada donde esté situada la señal. Salvo indicación contraria, la prohibición comienza en la vertical de la señal y termina en la intersección más próxima en el sentido de la marcha.",
//                        // Prohibits stopping or parking on the side of the road where the sign is placed.
//                        images: ["R307"],
//                        wrongAnswers: [
//                            "Prohibido estacionar", // No parking
//                            "Prohibido adelantar", // No overtaking
//                            "Entrada prohibida", // No entry
//                            "Fin de prohibiciones", // End of restrictions
//                            "Prohibido bicicletas", // No bicycles
//                            "Prohibido vehículos de motor" // No motor vehicles
//                        ],
//                        sectionName: "Señales de Reglamentación", // Regulatory Signs
//                        subSectionName: "Prohibición o Restricción"
//                    ),
//                    TrafficSign(
//                        title: "Estacionamiento prohibido", // No parking
//                        description: "Prohibición de estacionamiento en el lado de la calzada en que esté situada la señal. Salvo indicación en contrario, la prohibición comienza en la vertical de la señal y termina en la intersección más próxima en el sentido de la marcha. No prohíbe la parada.",
//                        images: ["R308"],
//                        wrongAnswers: [
//                            "Stop", // Stop
//                            "Ceda el paso", // Yield
//                            "Entrada prohibida", // No entry
//                            "Prohibido peatones", // No pedestrians
//                            "Prohibido bicicletas", // No bicycles
//                            "Prohibido adelantar", // No overtaking
//                            "Prohibido camiones" // No trucks
//                        ],
//                        sectionName: "Señales de Reglamentación", // Regulatory Signs
//                        subSectionName: "Prohibición o Restricción"
//                    ),
//                    TrafficSign(
//                        title: "Estacionamiento prohibido la primera quincena", // No parking (1st half of month)
//                        description: "Prohíbe el estacionamiento de vehículos en la zona señalizada durante la primera mitad del mes (días 1 a 15).",
//                        // Prohibits vehicle parking in the marked area during the first half of the month (days 1–15).
//                        images: ["R308c"],
//                        wrongAnswers: [
//                            "Prohibido parar", // No stopping
//                            "Stop", // Stop
//                            "Ceda el paso", // Yield
//                            "Entrada prohibida", // No entry
//                            "Prohibido peatones", // No pedestrians
//                            "Prohibido bicicletas", // No bicycles
//                            "Prohibido adelantar" // No overtaking
//                        ],
//                        sectionName: "Señales de Reglamentación", // Regulatory Signs
//                        subSectionName: "Prohibición o Restricción"
//                    ),
//                    TrafficSign(
//                        title: "Estacionamiento prohibido la segunda quincena", // No parking (2nd half of month)
//                        description: "Señal de prohibición de estacionamiento en España y Andorra, utilizada para la segunda mitad del mes.",
//                        // No parking sign used in Spain and Andorra, applicable for the second half of the month.
//                        images: ["R308d"],
//                        wrongAnswers: [
//                            "Prohibido parar", // No stopping
//                            "Prohibido estacionar", // No parking
//                            "Ceda el paso", // Yield
//                            "Stop", // Stop
//                            "Entrada prohibida", // No entry
//                            "Prohibido giro a la izquierda", // No left turn
//                        ],
//                        sectionName: "Señales de Reglamentación", // Regulatory Signs
//                        subSectionName: "Prohibición o Restricción"
//                    ),
//                    TrafficSign(
//                        title: "Prohibido estacionar (Vado permanente)", // No parking (Permanent driveway)
//                        description: "Prohíbe el estacionamiento frente a un acceso autorizado (vado permanente), garantizando la entrada y salida de vehículos en todo momento.",
//                        // Prohibits parking in front of an authorized driveway (permanent access), ensuring vehicle entry and exit at all times.
//                        images: ["R308e"],
//                        wrongAnswers: [
//                            "Prohibido parar", // No stopping
//                            "Entrada prohibida", // No entry
//                            "Stop", // Stop
//                            "Ceda el paso", // Yield
//                            "Prohibido bicicletas" // No bicycles
//                        ],
//                        sectionName: "Señales de Reglamentación", // Regulatory Signs
//                        subSectionName: "Prohibición o Restricción"
//                    ),
//                    TrafficSign(
//                        title: "Zona de estacionamiento limitado", // Limited parking zone
//                        description: "Indica una zona en la que el estacionamiento está permitido únicamente durante un tiempo limitado, normalmente regulado mediante parquímetro o disco horario.",
//                        // Indicates an area where parking is only allowed for a limited time, usually regulated by parking meter or time disc.
//                        images: ["R309"],
//                        wrongAnswers: [
//                            "Prohibido parar", // No stopping
//                            "Entrada prohibida", // No entry
//                            "Stop", // Stop
//                            "Ceda el paso" // Yield
//                        ],
//                        sectionName: "Señales de Reglamentación", // Regulatory Signs
//                        subSectionName: "Prohibición o Restricción"
//                    ),
//                    TrafficSign(
//                        title: "Advertencias acústicas prohibidas",
//                        description: "Prohíbe el uso de señales acústicas (como el claxon), salvo en casos de emergencia o cuando sea estrictamente necesario para evitar un accidente.",
//                        // Prohibits the use of audible signals (such as the horn), except in emergencies or when strictly necessary to prevent an accident.
//                        images: ["R310"],
//                        wrongAnswers: [
//                            "Prohibido peatones", // No pedestrians
//                            "Prohibido estacionar", // No parking
//                            "Prohibido parar", // No stopping
//                            "Entrada prohibida", // No entry
//                            "Stop", // Stop
//                            "Ceda el paso", // Yield
//                            "Prohibido bicicletas" // No bicycles
//                        ],
//                        sectionName: "Señales de Reglamentación", // Regulatory Signs
//                        subSectionName: "Prohibición o Restricción"
//                    ),
//                ]
//            ),
//            TrafficSubSection(
//                index: 4,
//                name: "Señales de obligación",
//                description: "Indican una acción que los conductores deben realizar obligatoriamente, como girar en una dirección o seguir una vía determinada. Son circulares, de color azul con borde blanco.",
//                signs: [
//                    TrafficSign(
//                        title: "Sentido obligatorio",
//                        description: "Obliga a los vehículos a seguir la dirección indicada en la señal. Puede ser girar a la derecha, girar a la izquierda o seguir recto, según la variante mostrada.",
//                        images: ["R400a", "R400b", "R400c", "R400d", "R400e"],
//                        wrongAnswers: [
//                            "Prohibido girar a la derecha",
//                            "Prohibido girar a la izquierda",
//                            "Prohibido cambiar de sentido",
//                            "Entrada prohibida",
//                            "Ceda el paso",
//                            "Stop",
//                            "Velocidad máxima 50",
//                            "Prohibido estacionar"
//                        ],
//                        sectionName: "Señales de Reglamentación",
//                        subSectionName: "Señales de Obligación"
//                    ),
//                    TrafficSign(
//                        title: "Paso obligatorio", // Mandatory direction (pass side)
//                        description: "Indica la obligación de pasar por el lado indicado de un obstáculo o isla de tráfico (a la derecha, a la izquierda, o por cualquiera de los dos lados según la variante).",
//                        images: ["R401a", "R401b", "R401c"],
//                        wrongAnswers: [
//                            "Obligación de dirección", // Mandatory direction
//                            "Prohibido girar a la derecha", // No right turn
//                            "Prohibido girar a la izquierda", // No left turn
//                            "Entrada prohibida", // No entry
//                            "Ceda el paso", // Yield
//                            "Stop", // Stop
//                            "Prohibido adelantar", // No overtaking
//                            "Prohibido estacionar" // No parking
//                        ],
//                        sectionName: "Señales de Reglamentación",
//                        subSectionName: "Señales de Obligación"
//                    ),
//                    TrafficSign(
//                        title: "Rotonda", // Roundabout
//                        description: "Indica la obligación de circular en el sentido indicado dentro de una intersección giratoria o glorieta.",
//                        images: ["R402"],
//                        wrongAnswers: [
//                            "Obligación de dirección", // Mandatory direction
//                            "Obligación de paso", // Mandatory direction (pass side)
//                            "Prohibido girar a la derecha", // No right turn
//                            "Prohibido girar a la izquierda", // No left turn
//                            "Entrada prohibida", // No entry
//                            "Ceda el paso", // Yield
//                            "Stop", // Stop
//                            "Prohibido adelantar" // No overtaking
//                        ],
//                        sectionName: "Señales de Reglamentación",
//                        subSectionName: "Señales de Obligación"
//                    ),
//                    TrafficSign(
//                        title: "Direcciones obligatorias", // Mandatory directions
//                        description: "Indica la obligación de seguir una de las direcciones indicadas en la señal (recto o girar, según la variante mostrada).",
//                        // Indicates the obligation to follow one of the directions shown on the sign (straight or turn, depending on the variant).
//                        images: ["R403a", "R403b", "R403c"],
//                        wrongAnswers: [
//                            "Rotonda", // Roundabout
//                            "Prohibido girar a la derecha", // No right turn
//                            "Prohibido girar a la izquierda", // No left turn
//                            "Entrada prohibida", // No entry
//                            "Ceda el paso", // Yield
//                            "Stop" // Stop
//                        ],
//                        sectionName: "Señales de Reglamentación",
//                        subSectionName: "Señales de Obligación"
//                    ),
//                    TrafficSign(
//                        title: "Vía reservada para automóviles (excepto motocicletas sin sidecar)", // Road reserved for motor vehicles (except motorcycles without sidecar)
//                        description: "Indica una vía reservada exclusivamente a automóviles, quedando excluidas las motocicletas sin sidecar.",
//                        // Indicates a road reserved exclusively for cars, excluding motorcycles without sidecar.
//                        images: ["R404"],
//                        wrongAnswers: [
//                            "Vía obligatoria para motocicletas", // Mandatory road for motorcycles
//                            "Prohibido automóviles", // No cars
//                            "Vía obligatoria para ciclomotores", // Mandatory road for mopeds
//                            "Entrada prohibida a vehículos de motor", // No entry for motor vehicles
//                            "Prohibido camiones", // No trucks
//                            "Prohibido autobuses", // No buses
//                            "Prohibido bicicletas", // No bicycles
//                            "Prohibido estacionar" // No parking
//                        ],
//                        sectionName: "Señales de Reglamentación",
//                        subSectionName: "Señales de Obligación"
//                    ),
//                    TrafficSign(
//                        title: "Calzada para motocicletas sin sidecar",
//                        description: "Indica la obligación de paso exclusivo para motocicletas.", // Indicates the obligation for motorcycles to pass
//                        images: ["R405"],
//                        wrongAnswers: [
//                            "Sólo vehículos a motor (excepto motocicletas)", // Only motor vehicles (except motorcycles)
//                            "Sólo automóviles", // Only cars
//                            "Prohibido motocicletas", // No motorcycles
//                            "Sólo ciclomotores", // Only mopeds
//                            "Sólo bicicletas", // Only bicycles
//                            "Entrada prohibida a vehículos de motor", // No entry for motor vehicles
//                            "Prohibido camiones", // No trucks
//                            "Entrada prohibida" // No entry
//                        ],
//                        sectionName: "Señales de Reglamentación",
//                        subSectionName: "Señales de Obligación"
//                    ),
//                    TrafficSign(
//                        title: "Calzada para camiones, furgones y furgonetas", // Road for trucks, vans, and lorries
//                        description: "Indica una vía reservada exclusivamente a camiones y otros vehículos destinados al transporte de mercancías.",
//                        // Indicates a road reserved exclusively for trucks and other goods transport vehicles.
//                        images: ["R406"],
//                        wrongAnswers: [
//                            "Vía obligatoria para motocicletas", // Mandatory road for motorcycles
//                            "Vía obligatoria para ciclomotores", // Mandatory road for mopeds
//                            "Prohibido camiones", // No trucks
//                            "Sólo automóviles", // Only cars
//                            "Sólo bicicletas", // Only bicycles
//                            "Prohibido vehículos de motor", // No motor vehicles
//                            "Entrada prohibida", // No entry
//                            "Prohibido estacionar" // No parking
//                        ],
//                        sectionName: "Señales de Reglamentación",
//                        subSectionName: "Señales de Obligación"
//                    ),
//                    TrafficSign(
//                        title: "Vía obligatoria y reservada para bicicletas", // Mandatory road for bicycles
//                        description: "Indica una vía reservada y de uso obligatorio para bicicletas. Los ciclistas deben circular por ella, quedando prohibido el uso a los demás vehículos.", // Indicates a road reserved and mandatory for bicycles. Other vehicles are not allowed to use it.
//                        images: ["R407a"],
//                        wrongAnswers: [
//                            "Vía obligatoria y reservada para ciclomotores", // Mandatory road for mopeds
//                            "Dirección obligatoria hacia la derecha", // Mandatory direction to the right
//                            "Dirección obligatoria hacia la izquierda", // Mandatory direction to the left
//                            "Paso obligatorio por la derecha", // Mandatory passage on the right
//                            "Paso obligatorio por la izquierda", // Mandatory passage on the left
//                            "Paso obligatorio para peatones", // Mandatory passage for pedestrians
//                            "Uso obligatorio de cadenas para nieve" // Mandatory use of snow chains
//                        ],
//                        sectionName: "Señales de Reglamentación",
//                        subSectionName: "Señales de Obligación"
//                    ),
//                    TrafficSign(
//                        title: "Vía obligatoria y reservada para ciclomotores", // Mandatory road for mopeds
//                        description: "Vía reservada y obligatoria para ciclomotores. Los conductores de ciclomotores deben circular por esta vía, quedando prohibido el uso a los demás usuarios.", // Indicates a road reserved and mandatory for mopeds; other users are prohibited
//                        images: ["R407b"],
//                        wrongAnswers: [
//                            "Vía obligatoria y reservada para bicicletas", // Mandatory road for bicycles
//                            "Dirección obligatoria hacia la derecha", // Mandatory direction to the right
//                            "Dirección obligatoria hacia la izquierda", // Mandatory direction to the left
//                            "Paso obligatorio por la derecha", // Mandatory passage on the right
//                            "Paso obligatorio por la izquierda", // Mandatory passage on the left
//                            "Paso obligatorio para peatones", // Mandatory passage for pedestrians
//                            "Uso obligatorio de cadenas para nieve" // Mandatory use of snow chains
//                        ],
//                        sectionName: "Señales de Reglamentación",
//                        subSectionName: "Señales de Obligación"
//                    ),
//                    TrafficSign(
//                        title: "Camino obligatorio para vehículos de tracción animal", // Mandatory passage for animal-drawn vehicles
//                        description: "Calzada de paso obligatorio para vehículos de tracción animal. Los conductores de este tipo de vehículos deben circular por la vía señalizada, estando prohibido a los demás usuarios.", // Road where animal-drawn vehicles must circulate
//                        images: ["R408"],
//                        wrongAnswers: [
//                            "Paso obligatorio para camiones", // Mandatory passage for trucks
//                            "Paso obligatorio para bicicletas", // Mandatory passage for bicycles
//                            "Paso obligatorio para ciclomotores", // Mandatory passage for mopeds
//                            "Paso obligatorio para motocicletas", // Mandatory passage for motorcycles
//                            "Obligación de paso a la derecha", // Mandatory passage to the right
//                            "Obligación de paso a la izquierda", // Mandatory passage to the left
//                            "Rotonda", // Roundabout
//                            "Entrada prohibida" // No entry
//                        ],
//                        sectionName: "Señales de Reglamentación",
//                        subSectionName: "Señales de Obligación"
//                    ),
//                    TrafficSign(
//                        title: "Camino obligatorio y reservado para animales de montura", // Mandatory passage for mounted animals
//                        description: "Indica la obligación de paso exclusivo para animales de montura, como caballos con jinete.", // Indicates the obligation for mounted animals such as horses with riders
//                        images: ["R409"],
//                        wrongAnswers: [
//                            "Prohibido animales de montura", // No mounted animals
//                            "Paso obligatorio para ciclomotores", // Mandatory passage for mopeds
//                            "Paso obligatorio para bicicletas", // Mandatory passage for bicycles
//                            "Sólo vehículos a motor (excepto motocicletas)", // Only motor vehicles (except motorcycles)
//                            "Prohibido camiones", // No trucks
//                            "Sólo automóviles", // Only cars
//                            "Entrada prohibida", // No entry
//                            "Prohibido motocicletas" // No motorcycles
//                        ],
//                        sectionName: "Señales de Reglamentación",
//                        subSectionName: "Señales de Obligación"
//                    ),
//                    TrafficSign(
//                        title: "Camino reservado para peatones", // Mandatory path for pedestrians
//                        description: "Indica la obligación de uso exclusivo para peatones. Los peatones deben circular por este camino, quedando prohibido el uso a los demás usuarios.", // Indicates the obligation for exclusive pedestrian use
//                        images: ["R410"],
//                        wrongAnswers: [
//                            "Paso obligatorio para bicicletas", // Mandatory passage for bicycles
//                            "Paso obligatorio para ciclomotores", // Mandatory passage for mopeds
//                            "Paso obligatorio para motocicletas", // Mandatory passage for motorcycles
//                            "Paso obligatorio para vehículos de tracción animal", // Mandatory passage for animal-drawn vehicles
//                            "Prohibido peatones", // No pedestrians
//                            "Sólo automóviles", // Only cars
//                            "Entrada prohibida", // No entry
//                            "Prohibido camiones" // No trucks
//                        ],
//                        sectionName: "Señales de Reglamentación",
//                        subSectionName: "Señales de Obligación"
//                    ),
//                    TrafficSign(
//                        title: "Velocidad mínima", // Minimum speed
//                        description: "Obligación para los conductores de vehículos de circular, por lo menos, a la velocidad indicada por la cifra, en kilómetros por hora, que figure en la señal, desde el lugar en que esté situada hasta otra de velocidad mínima diferente, o de fin de velocidad mínima o de velocidad máxima de valor igual o inferior.", // Obligation for drivers to travel at least the speed indicated (km/h) until a new minimum speed, end of minimum speed, or a maximum speed of equal or lower value
//                        images: ["R411"],
//                        wrongAnswers: [
//                            "Velocidad máxima", // Maximum speed
//                            "Distancia mínima obligatoria", // Minimum distance
//                            "Prohibido adelantar", // No overtaking
//                            "Entrada prohibida", // No entry
//                            "Ceda el paso", // Yield
//                            "Stop", // Stop
//                            "Prohibido camiones", // No trucks
//                            "Prohibido peatones" // No pedestrians
//                        ],
//                        sectionName: "Señales de Reglamentación",
//                        subSectionName: "Señales de Obligación"
//                    ),
//                    TrafficSign(
//                        title: "Obligatorio usar cadenas para nieve", // Snow chains required
//                        description: "Obligación de circular con cadenas u otros dispositivos autorizados en los neumáticos de las ruedas motrices cuando la calzada esté cubierta de nieve.", // Obligation to drive with snow chains or other approved devices on the driving wheels when the road is covered with snow
//                        images: ["R412"],
//                        wrongAnswers: [
//                            "Velocidad mínima", // Minimum speed
//                            "Velocidad máxima", // Maximum speed
//                            "Entrada prohibida", // No entry
//                            "Ceda el paso", // Yield
//                            "Stop", // Stop
//                            "Prohibido camiones", // No trucks
//                            "Prohibido adelantar" // No overtaking
//                        ],
//                        sectionName: "Señales de Reglamentación",
//                        subSectionName: "Señales de Obligación"
//                    ),
//                    TrafficSign(
//                        title: "Obligatorio usar neumáticos especiales de invierno", // Winter tires required
//                        description: "Obliga a circular únicamente con neumáticos especiales de invierno. Según el Real Decreto 465/2025, de 10 de junio, que modifica el Reglamento General de Circulación en materia de señalización de tráfico.",
//                        // Requires driving only with special winter tires. According to Royal Decree 465/2025 on traffic signage.
//                        images: ["R412b"],
//                        wrongAnswers: [
//                            "Velocidad mínima", // Minimum speed
//                            "Entrada prohibida", // No entry
//                            "Prohibido camiones", // No trucks
//                            "Prohibido adelantar", // No overtaking
//                            "Prohibido peatones", // No pedestrians
//                            "Stop", // Stop
//                            "Ceda el paso" // Yield
//                        ],
//                        sectionName: "Señales de Reglamentación",
//                        subSectionName: "Señales de Obligación"
//                    ),
//                    TrafficSign(
//                        title: "Alumbrado de corto alcance", // Mandatory lights
//                        description: "Obliga a circular con alumbrado encendido, incluso de día, en el tramo de vía señalizado.", // Obligation to drive with lights on, even during the day, on the marked road section
//                        images: ["R413"],
//                        wrongAnswers: [
//                            "Velocidad mínima", // Minimum speed
//                            "Velocidad máxima", // Maximum speed
//                            "Entrada prohibida", // No entry
//                            "Prohibido camiones", // No trucks
//                            "Prohibido adelantar", // No overtaking
//                            "Prohibido peatones", // No pedestrians
//                            "Ceda el paso", // Yield
//                            "Stop" // Stop
//                        ],
//                        sectionName: "Señales de Reglamentación",
//                        subSectionName: "Señales de Obligación"
//                    ),
//                    TrafficSign(
//                        title: "Calzada para vehículos que transporten materias peligrosas", // Road for vehicles carrying dangerous materials
//                        description: "Indica una calzada reservada exclusivamente a vehículos que transporten materias peligrosas.",
//                        // Indicates a road reserved exclusively for vehicles carrying dangerous materials.
//                        images: ["R414"],
//                        wrongAnswers: [
//                            "Vía obligatoria para ciclomotores", // Mandatory road for mopeds
//                            "Vía obligatoria para bicicletas", // Mandatory road for bicycles
//                            "Prohibido materias peligrosas", // No dangerous goods
//                            "Entrada prohibida", // No entry
//                            "Prohibido camiones", // No trucks
//                            "Stop", // Stop
//                            "Ceda el paso" // Yield
//                        ],
//                        sectionName: "Señales de Reglamentación",
//                        subSectionName: "Señales de Obligación"
//                    ),
//                    TrafficSign(
//                        title: "Calzada para vehículos que transporten productos contaminantes del agua", // Road for vehicles carrying water-polluting products
//                        description: "Indica una vía reservada a vehículos que transporten productos capaces de contaminar el agua.",
//                        // Indicates a road reserved for vehicles carrying substances that could pollute water.
//                        images: ["R415"],
//                        wrongAnswers: [
//                            "Camino reservado para peatones", // Pedestrian path
//                            "Calzada para vehículos que transporten materias peligrosas", // Road for vehicles with dangerous goods
//                            "Vía obligatoria para ciclomotores", // Mandatory road for mopeds
//                            "Prohibido camiones", // No trucks
//                            "Prohibido mercancías peligrosas", // No dangerous goods
//                            "Entrada prohibida", // No entry
//                            "Calzada para vehículos que transporten materias explosivas o inflamables" // Yield
//                        ],
//                        sectionName: "Señales de Reglamentación",
//                        subSectionName: "Señales de Obligación"
//                    ),
//                    TrafficSign(
//                        title: "Calzada para vehículos que transporten materias explosivas o inflamables", // Road for vehicles carrying explosives or flammable materials
//                        description: "Indica una vía reservada exclusivamente a vehículos que transporten materias explosivas o fácilmente inflamables.",
//                        // Indicates a road reserved exclusively for vehicles carrying explosive or flammable materials.
//                        images: ["R416"],
//                        wrongAnswers: [
//                            "Calzada para vehículos que transporten productos contaminantes del agua", // Road for vehicles carrying water-polluting products
//                            "Vía obligatoria para camiones", // Mandatory road for trucks
//                            "Prohibido mercancías peligrosas", // No dangerous goods
//                            "Entrada prohibida", // No entry
//                            "Prohibido vehículos de motor", // No motor vehicles
//                        ],
//                        sectionName: "Señales de Reglamentación",
//                        subSectionName: "Señales de Obligación"
//                    ),
//                    TrafficSign(
//                        title: "Uso obligatorio del cinturón de seguridad", // Seat belt mandatory
//                        description: "Indica la obligatoriedad de utilizar el cinturón de seguridad en el tramo de vía señalizado.", // Indicates the obligation to use seat belts
//                        images: ["R417"],
//                        wrongAnswers: [
//                            "Cascos obligatorios", // Helmets mandatory
//                            "Entrada prohibida", // No entry
//                            "Prohibido adelantar", // No overtaking
//                            "Prohibido estacionar", // No parking
//                            "Stop", // Stop
//                            "Ceda el paso", // Yield
//                            "Velocidad mínima", // Minimum speed
//                            "Velocidad máxima" // Maximum speed
//                        ],
//                        sectionName: "Señales de Reglamentación",
//                        subSectionName: "Señales de Obligación"
//                    ),
//                    TrafficSign(
//                        title: "Carril obligatorio para telepeaje", // Mandatory lane for electronic toll
//                        description: "Vía exclusiva para vehículos dotados de equipo de telepeaje operativo. Telepeaje obligatorio.",
//                        images: ["R418"],
//                        wrongAnswers: [
//                            "Peaje", // Toll
//                            "Ceda el paso", // Yield
//                            "Stop", // Stop
//                            "Entrada prohibida", // No entry
//                            "Prohibido camiones", // No trucks
//                            "Prohibido estacionar", // No parking
//                            "Velocidad mínima", // Minimum speed
//                            "Velocidad máxima" // Maximum speed
//                        ],
//                        sectionName: "Señales de Reglamentación",
//                        subSectionName: "Señales de Obligación"
//                    ),
//                    TrafficSign(
//                        title: "Camino obligatorio a tractores", // Mandatory road for tractors
//                        description: "Señal que indica la obligación de circular exclusivamente a tractores por el camino señalado. Conforme al proyecto de Real Decreto por el que se modifica el Reglamento General de Circulación, aprobado por Real Decreto 1428/2003, de 21 de noviembre.", // Road reserved and mandatory for tractors, according to Royal Decree modification
//                        images: ["R419"],
//                        wrongAnswers: [
//                            "Prohibido camiones", // No trucks
//                            "Prohibido tractores", // No tractors
//                            "Entrada prohibida", // No entry
//                            "Sólo vehículos a motor", // Only motor vehicles
//                            "Prohibido ciclomotores", // No mopeds
//                            "Prohibido motocicletas", // No motorcycles
//                            "Stop", // Stop
//                            "Ceda el paso" // Yield
//                        ],
//                        sectionName: "Señales de Reglamentación",
//                        subSectionName: "Señales de Obligación"
//                    ),
//                    TrafficSign(
//                        title: "Camino obligatorio para vehículos de movilidad personal", // Mandatory lane for personal mobility vehicles
//                        description: "Obligación para los conductores de vehículos de movilidad personal de circular por la vía a cuya entrada esté situada y prohibición a los demás usuarios de la vía de utilizarla.", // Obligation for personal mobility vehicles to use this road; others are prohibited
//                        images: ["R420"],
//                        wrongAnswers: [
//                            "Vía obligatoria para ciclos", // Mandatory lane for bicycles
//                            "Vía obligatoria para ciclomotores", // Mandatory lane for mopeds
//                            "Camino reservado para peatones", // Mandatory path for pedestrians
//                            "Prohibido vehículos de movilidad personal", // No personal mobility vehicles
//                            "Entrada prohibida", // No entry
//                            "Sólo vehículos a motor", // Only motor vehicles
//                            "Stop", // Stop
//                            "Ceda el paso" // Yield
//                        ],
//                        sectionName: "Señales de Reglamentación",
//                        subSectionName: "Señales de Obligación"
//                    ),
//                    TrafficSign(
//                        title: "Vía obligatoria para ciclos y vehículos de movilidad personal", // Mandatory lane for bicycles and personal mobility vehicles
//                        description: "Camino obligatorio para ciclos y para vehículos de movilidad personal.",
//                        images: ["R421"],
//                        wrongAnswers: [
//                            "Vía obligatoria para ciclomotores", // Mandatory lane for mopeds
//                            "Vía obligatoria para motocicletas", // Mandatory lane for motorcycles
//                            "Camino reservado para peatones", // Mandatory path for pedestrians
//                            "Prohibido bicicletas", // No bicycles
//                            "Prohibido vehículos de movilidad personal", // No personal mobility vehicles
//                            "Entrada prohibida", // No entry
//                            "Stop", // Stop
//                            "Ceda el paso" // Yield
//                        ],
//                        sectionName: "Señales de Reglamentación",
//                        subSectionName: "Señales de Obligación"
//                    ),
//                    TrafficSign(
//                        title: "Obligatorio desmontar y continuar a pie.",
//                        description: "Obliga a los conductores de ciclos o de vehículos de movilidad personal a desmontar y proseguir a pie por el tramo indicado.", // Requires cyclists or personal mobility vehicle users to dismount and continue on foot
//                        images: ["R422"],
//                        wrongAnswers: [
//                            "Camino reservado para peatones", // Mandatory path for pedestrians
//                            "Vía obligatoria para vehículos de movilidad personal", // Mandatory lane for personal mobility vehicles
//                            "Vía obligatoria para ciclos", // Mandatory lane for bicycles
//                            "Prohibido bicicletas", // No bicycles
//                            "Prohibido vehículos de movilidad personal", // No personal mobility vehicles
//                            "Entrada prohibida", // No entry
//                            "Stop", // Stop
//                            "Ceda el paso" // Yield
//                        ],
//                        sectionName: "Señales de Reglamentación",
//                        subSectionName: "Señales de Obligación"
//                    ),
//                ]
//            ),
//            TrafficSubSection(
//                index: 5,
//                name: "Fin de prohibición o restricción",
//                description: "Marcan el punto donde termina una prohibición o restricción anterior. Son circulares con fondo blanco, mostrando el fin de la limitación indicada.",
//                signs: [
//                    TrafficSign(
//                        title: "Fin de prohibiciones",
//                        description: "Señala el lugar desde el que todas las prohibiciones específicas indicadas por señales anteriores de prohibición para vehículos en movimiento dejan de tener aplicación.",
//                        images: ["R500"],
//                        wrongAnswers: [
//                            "Fin de la limitación de velocidad", // End of speed limit
//                            "Fin de la velocidad mínima", // End of minimum speed
//                            "Fin de zona de estacionamiento limitado", // End of limited parking zone
//                            "Fin de calzada obligatoria para camiones", // End of mandatory road for trucks
//                            "Fin de prioridad", // End of priority
//                            "Fin de vía ciclista" // End of cycle lane
//                        ],
//                        sectionName: "Señales de Reglamentación",
//                        subSectionName: "Fin de prohibición o restricción"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Fin de la limitación de velocidad", // End of maximum speed limit
//                        description: "Señala el lugar desde donde deja de ser aplicable una señal anterior de velocidad máxima.",
//                        images: ["R501"],
//                        wrongAnswers: [
//                            "Fin de la velocidad mínima", // End of minimum speed
//                            "Fin de prohibiciones", // End of prohibitions
//                            "Fin de la prohibición de adelantamiento", // End of overtaking prohibition
//                            "Fin de la prohibición de adelantamiento para camiones", // End of truck overtaking prohibition
//                            "Fin de calzada obligatoria para automóviles", // End of mandatory road for cars
//                            "Fin de la prohibición de señales acústicas", // End of acoustic signal prohibition
//                            "Fin de zona de estacionamiento limitado", // End of limited parking zone
//                            "Fin de prioridad" // End of priority
//                        ],
//                        sectionName: "Señales de Reglamentación",
//                        subSectionName: "Fin de prohibición o restricción"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Fin de la prohibición de adelantamiento", // End of no overtaking
//                        description: "Señala el lugar desde donde deja de ser aplicable una señal anterior de adelantamiento prohibido.",
//                        images: ["R502"],
//                        wrongAnswers: [
//                            "Fin de la limitación de velocidad", // End of speed limit
//                            "Fin de prohibiciones", // End of prohibitions
//                            "Fin de la velocidad mínima", // End of minimum speed
//                            "Fin de calzada obligatoria para camiones", // End of mandatory road for trucks
//                            "Fin de calzada obligatoria para motocicletas", // End of mandatory road for motorcycles
//                            "Fin de la prohibición de señales acústicas", // End of acoustic signal prohibition
//                            "Fin de zona de estacionamiento limitado" // End of limited parking zone
//                        ],
//                        sectionName: "Señales de Reglamentación",
//                        subSectionName: "Fin de prohibición o restricción"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Fin de la prohibición de adelantamiento para camiones", // End of no overtaking for trucks
//                        description: "Señala el lugar desde donde deja de ser aplicable una señal anterior de adelantamiento prohibido para camiones.",
//                        images: ["R503"],
//                        wrongAnswers: [
//                            "Fin de la limitación de velocidad", // End of speed limit
//                            "Fin de prohibiciones", // End of prohibitions
//                            "Fin de la velocidad mínima", // End of minimum speed
//                            "Fin de la prohibición de señales acústicas", // End of acoustic signal prohibition
//                            "Fin de calzada obligatoria para camiones", // End of mandatory road for trucks
//                            "Fin de zona de estacionamiento limitado", // End of limited parking zone
//                            "Fin de prioridad" // End of priority
//                        ],
//                        sectionName: "Señales de Reglamentación",
//                        subSectionName: "Fin de prohibición o restricción"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Fin de zona de estacionamiento limitado", // End of limited parking zone
//                        description: "Señala el lugar desde donde deja de ser aplicable una anterior señal de zona de estacionamiento limitado.",
//                        images: ["R504"],
//                        wrongAnswers: [
//                            "Fin de la limitación de velocidad", // End of speed limit
//                            "Fin de prohibiciones", // End of prohibitions
//                            "Fin de la velocidad mínima", // End of minimum speed
//                            "Fin de la prohibición de adelantamiento", // End of overtaking prohibition
//                            "Fin de la prohibición de señales acústicas", // End of acoustic signal prohibition
//                            "Fin de calzada obligatoria para automóviles", // End of mandatory road for cars
//                            "Fin de prioridad" // End of priority
//                        ],
//                        sectionName: "Señales de Reglamentación",
//                        subSectionName: "Fin de prohibición o restricción"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Fin de vía reservada y obligatoria para ciclos", // End of mandatory lane for bicycles
//                        description: "Señala el lugar desde donde deja de ser aplicable una señal anterior de vía reservada y obligatoria para ciclos.",
//                        images: ["R505"],
//                        wrongAnswers: [
//                            "Fin de vía reservada para ciclomotores", // End of lane for mopeds
//                            "Fin de vía reservada para peatones", // End of lane for pedestrians
//                            "Fin de vía reservada para vehículos de movilidad personal", // End of lane for personal mobility vehicles
//                            "Fin de calzada obligatoria para camiones", // End of mandatory road for trucks
//                            "Fin de calzada obligatoria para motocicletas", // End of mandatory road for motorcycles
//                            "Fin de calzada obligatoria para automóviles", // End of mandatory road for cars
//                            "Fin de prohibiciones", // End of prohibitions
//                            "Fin de prioridad" // End of priority
//                        ],
//                        sectionName: "Señales de Reglamentación",
//                        subSectionName: "Fin de prohibición o restricción"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Fin de la prohibición de señales acústicas", // End of acoustic signal prohibition
//                        description: "Indica el lugar donde deja de ser aplicable la señal de prohibición de uso de señales acústicas, como el claxon.",
//                        images: ["R505a"],
//                        wrongAnswers: [
//                            "Fin de la limitación de velocidad", // End of speed limit
//                            "Fin de prohibiciones", // End of prohibitions
//                            "Fin de la velocidad mínima", // End of minimum speed
//                            "Fin de zona de estacionamiento limitado", // End of limited parking zone
//                            "Fin de la prohibición de adelantamiento", // End of overtaking prohibition
//                            "Fin de calzada obligatoria para camiones", // End of mandatory road for trucks
//                            "Fin de vía reservada para ciclos", // End of lane for bicycles
//                            "Fin de prioridad" // End of priority
//                        ],
//                        sectionName: "Señales de Reglamentación",
//                        subSectionName: "Fin de prohibición o restricción"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Fin de la velocidad mínima", // End of minimum speed
//                        description: "Señala el lugar desde donde deja de ser aplicable una señal anterior de velocidad mínima.",
//                        images: ["R506"],
//                        wrongAnswers: [
//                            "Fin de la limitación de velocidad", // End of maximum speed limit
//                            "Fin de prohibiciones", // End of prohibitions
//                            "Fin de la prohibición de adelantamiento", // End of no overtaking
//                            "Fin de la prohibición de adelantamiento para camiones", // End of no overtaking for trucks
//                            "Fin de la prohibición de señales acústicas", // End of acoustic signal prohibition
//                            "Fin de calzada obligatoria para camiones", // End of mandatory road for trucks
//                            "Fin de zona de estacionamiento limitado", // End of limited parking zone
//                            "Fin de prioridad" // End of priority
//                        ],
//                        sectionName: "Señales de Reglamentación",
//                        subSectionName: "Fin de prohibición o restricción"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Fin de calzada obligatoria para automóviles (excepto motocicletas de dos ruedas)", // End of mandatory road for cars (except two-wheeled motorcycles)
//                        description: "Señala el lugar desde donde deja de ser aplicable una señal anterior de calzada obligatoria para automóviles, excepto motocicletas de dos ruedas y vehículos de tres ruedas asimilados a motocicletas.",
//                        images: ["R507"],
//                        wrongAnswers: [
//                            "Fin de calzada obligatoria para motocicletas", // End of mandatory road for motorcycles
//                            "Fin de calzada obligatoria para camiones", // End of mandatory road for trucks
//                            "Fin de calzada obligatoria para ciclomotores", // End of mandatory road for mopeds
//                            "Fin de vía reservada para ciclos", // End of bicycle lane
//                            "Fin de prohibiciones", // End of prohibitions
//                            "Fin de la velocidad mínima", // End of minimum speed
//                            "Fin de la limitación de velocidad", // End of speed limit
//                            "Fin de prioridad" // End of priority
//                        ],
//                        sectionName: "Señales de Reglamentación",
//                        subSectionName: "Fin de prohibición o restricción"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Fin de calzada obligatoria para motocicletas de dos ruedas", // End of mandatory road for two-wheeled motorcycles
//                        description: "Señala el lugar desde donde deja de ser aplicable una señal anterior de calzada obligatoria para motocicletas de dos ruedas y vehículos de tres ruedas asimilados a motocicletas.",
//                        images: ["R508"],
//                        wrongAnswers: [
//                            "Fin de calzada obligatoria para automóviles", // End of mandatory road for cars
//                            "Fin de calzada obligatoria para camiones", // End of mandatory road for trucks
//                            "Fin de calzada obligatoria para ciclomotores", // End of mandatory road for mopeds
//                            "Fin de vía reservada para ciclos", // End of lane for bicycles
//                            "Fin de prohibiciones", // End of prohibitions
//                            "Fin de la velocidad mínima", // End of minimum speed
//                            "Fin de la limitación de velocidad", // End of speed limit
//                            "Fin de prioridad" // End of priority
//                        ],
//                        sectionName: "Señales de Reglamentación",
//                        subSectionName: "Fin de prohibición o restricción"
//                    ),
//                    
//                    TrafficSign(
//                        title: "Fin de calzada obligatoria para camiones", // End of mandatory road for trucks
//                        description: "Señala el lugar desde donde deja de ser aplicable una señal anterior de calzada obligatoria para camiones, tractocamiones y furgones o furgonetas.",
//                        images: ["R509"],
//                        wrongAnswers: [
//                            "Fin de calzada obligatoria para automóviles", // End of mandatory road for cars
//                            "Fin de calzada obligatoria para motocicletas", // End of mandatory road for motorcycles
//                            "Fin de calzada obligatoria para ciclomotores", // End of mandatory road for mopeds
//                            "Fin de vía reservada para ciclos", // End of lane for bicycles
//                            "Fin de prohibiciones", // End of prohibitions
//                            "Fin de la velocidad mínima", // End of minimum speed
//                            "Fin de la limitación de velocidad", // End of speed limit
//                            "Fin de prioridad" // End of priority
//                        ],
//                        sectionName: "Señales de Reglamentación",
//                        subSectionName: "Fin de prohibición o restricción"
//                    ),
//                    TrafficSign(
//                        title: "Fin de vía reservada y obligatoria para ciclomotores", // End of reserved and mandatory road for mopeds
//                        description: "Señala el lugar desde donde deja de ser aplicable una señal anterior de vía reservada y obligatoria para ciclomotores.",
//                        images: ["R510"],
//                        wrongAnswers: [
//                            "Fin de camino obligatorio para tractores", // End of mandatory road for tractors
//                            "Fin de camino reservado y obligatorio para peatones", // End of mandatory pedestrian path
//                            "Fin de camino reservado y obligatorio para animales de montura", // End of mandatory road for riding animals
//                            "Fin de calzada obligatoria para camiones", // End of mandatory road for trucks
//                            "Fin de velocidad mínima", // End of minimum speed
//                            "Fin de vía reservada y obligatoria para ciclos", // End of mandatory road for cycles
//                            "Fin de prohibición de señales acústicas", // End of acoustic signals prohibition
//                            "Fin de calzada obligatoria para automóviles" // End of mandatory road for cars
//                        ],
//                        sectionName: "Señales de Reglamentación",
//                        subSectionName: "Fin de prohibición o restricción"
//                    ),
//                    TrafficSign(
//                        title: "Fin de camino obligatorio para vehículos de tracción animal", // End of mandatory road for animal-drawn vehicles
//                        description: "Señala el lugar desde donde deja de ser aplicable una señal anterior de camino obligatorio para vehículos de tracción animal.",
//                        images: ["R511"],
//                        wrongAnswers: [
//                            "Fin de camino reservado y obligatorio para animales de montura", // End of mandatory road for riding animals
//                            "Fin de camino reservado y obligatorio para peatones", // End of mandatory pedestrian path
//                            "Fin de vía reservada y obligatoria para ciclomotores", // End of mandatory road for mopeds
//                            "Fin de calzada obligatoria para camiones", // End of mandatory road for trucks
//                            "Fin de velocidad mínima", // End of minimum speed
//                            "Fin de vía reservada y obligatoria para ciclos", // End of mandatory road for cycles
//                            "Fin de prohibición de señales acústicas", // End of acoustic signals prohibition
//                            "Fin de calzada obligatoria para automóviles" // End of mandatory road for cars
//                        ],
//                        sectionName: "Señales de Reglamentación",
//                        subSectionName: "Fin de prohibición o restricción"
//                    ),
//                    TrafficSign(
//                        title: "Fin de camino reservado y obligatorio para animales de montura", // End of mandatory road for riding animals
//                        description: "Señala el lugar desde donde deja de ser aplicable una señal anterior de camino reservado y obligatorio para animales de montura.",
//                        images: ["R512"],
//                        wrongAnswers: [
//                            "Fin de camino obligatorio para vehículos de tracción animal", // End of mandatory road for animal-drawn vehicles
//                            "Fin de camino reservado y obligatorio para peatones", // End of mandatory pedestrian path
//                            "Fin de vía reservada y obligatoria para ciclomotores", // End of mandatory road for mopeds
//                            "Fin de calzada obligatoria para camiones", // End of mandatory road for trucks
//                            "Fin de velocidad mínima", // End of minimum speed
//                            "Fin de vía reservada y obligatoria para ciclos", // End of mandatory road for cycles
//                            "Fin de prohibición de señales acústicas", // End of acoustic signals prohibition
//                            "Fin de calzada obligatoria para automóviles" // End of mandatory road for cars
//                        ],
//                        sectionName: "Señales de Reglamentación",
//                        subSectionName: "Fin de prohibición o restricción"
//                    ),
//                    TrafficSign(
//                        title: "Fin de camino reservado y obligatorio para peatones", // End of mandatory pedestrian path
//                        description: "Señala el lugar desde donde deja de ser aplicable una señal anterior de camino reservado y obligatorio para peatones.",
//                        images: ["R513"],
//                        wrongAnswers: [
//                            "Fin de camino obligatorio para vehículos de tracción animal", // End of mandatory road for animal-drawn vehicles
//                            "Fin de camino reservado y obligatorio para animales de montura", // End of mandatory road for riding animals
//                            "Fin de vía reservada y obligatoria para ciclomotores", // End of mandatory road for mopeds
//                            "Fin de calzada obligatoria para camiones", // End of mandatory road for trucks
//                            "Fin de velocidad mínima", // End of minimum speed
//                            "Fin de vía reservada y obligatoria para ciclos", // End of mandatory road for cycles
//                            "Fin de prohibición de señales acústicas", // End of acoustic signals prohibition
//                            "Fin de calzada obligatoria para automóviles" // End of mandatory road for cars
//                        ],
//                        sectionName: "Señales de Reglamentación",
//                        subSectionName: "Fin de prohibición o restricción"
//                    ),
//                    TrafficSign(
//                        title: "Fin de camino obligatorio para tractores", // End of mandatory road for tractors
//                        description: "Señal conforme al proyecto de Real Decreto por el que se modifica el Reglamento General de Circulación, aprobado por Real Decreto 1428/2003, de 21 de noviembre, en materia de señalización de tráfico.",
//                        images: ["R514"],
//                        wrongAnswers: [
//                            "Fin de camino obligatorio para vehículos de tracción animal", // End of mandatory road for animal-drawn vehicles
//                            "Fin de camino reservado y obligatorio para animales de montura", // End of mandatory road for riding animals
//                            "Fin de camino reservado y obligatorio para peatones", // End of mandatory pedestrian path
//                            "Fin de vía reservada y obligatoria para ciclomotores", // End of mandatory road for mopeds
//                            "Fin de calzada obligatoria para camiones", // End of mandatory road for trucks
//                            "Fin de velocidad mínima", // End of minimum speed
//                            "Fin de vía reservada y obligatoria para ciclos", // End of mandatory road for cycles
//                            "Fin de prohibición de señales acústicas" // End of acoustic signals prohibition
//                        ],
//                        sectionName: "Señales de Reglamentación",
//                        subSectionName: "Fin de prohibición o restricción"
//                    ),
//                    TrafficSign(
//                        title: "Fin de vía reservada y obligatoria para ciclos", // End of mandatory road for bicycles
//                        description: "Indica el lugar donde deja de ser aplicable la señal de vía reservada y obligatoria para ciclos. A partir de este punto, los ciclistas deben circular según las normas generales de la vía.", // Marks where the previous mandatory road for bicycles ends
//                        images: ["R515"],
//                        wrongAnswers: [
//                            "Fin de vía reservada y obligatoria para ciclomotores", // End of mandatory road for mopeds
//                            "Fin de vía reservada y obligatoria para ciclos y para vehículos de movilidad personal", // End of mandatory road for bicycles and PMVs
//                            "Fin de camino reservado y obligatorio para peatones", // End of mandatory pedestrian path
//                            "Fin de camino reservado y obligatorio para animales de montura", // End of mandatory path for riding animals
//                            "Fin de camino obligatorio para tractores", // End of mandatory road for tractors
//                            "Fin de calzada obligatoria para camiones", // End of mandatory road for trucks
//                            "Fin de la velocidad mínima" // End of minimum speed
//                        ],
//                        sectionName: "Señales de Reglamentación",
//                        subSectionName: "Fin de prohibición o restricción"
//                    ),
//                    TrafficSign(
//                        title: "Fin de vía reservada y obligatoria para ciclos y para vehículos de movilidad personal", // End of mandatory lane for bicycles and personal mobility vehicles
//                        description: "Señala el lugar desde donde deja de ser aplicable una señal anterior de vía reservada y obligatoria para ciclos y vehículos de movilidad personal.", // Marks where a previous mandatory road for bicycles and PMVs ends
//                        images: ["R516"],
//                        wrongAnswers: [
//                            "Fin de vía reservada y obligatoria para ciclos", // End of mandatory road for bicycles
//                            "Fin de vía reservada y obligatoria para ciclomotores", // End of mandatory road for mopeds
//                            "Fin de camino reservado y obligatorio para peatones", // End of mandatory pedestrian path
//                            "Fin de camino reservado y obligatorio para animales de montura", // End of mandatory road for riding animals
//                            "Fin de camino obligatorio para tractores", // End of mandatory road for tractors
//                            "Fin de calzada obligatoria para camiones", // End of mandatory road for trucks
//                            "Fin de la velocidad mínima", // End of minimum speed
//                            "Fin de prohibición de señales acústicas" // End of acoustic signals prohibition
//                        ],
//                        sectionName: "Señales de Reglamentación",
//                        subSectionName: "Fin de prohibición o restricción"
//                    ),
//                ]
//            )],
//        signs: []
//    )
//    
//    // MARK: - Señales de Indicación (Information Signs)
//    static let indicacion = TrafficSection(
//        name: "Señales de Indicación",
//        description: """
//Las señales de indicación proporcionan información útil al conductor sobre servicios, direcciones, o características específicas de la vía. No imponen obligaciones ni prohibiciones, sino que orientan y facilitan la conducción.
//
//Suelen tener fondo azul o blanco, con símbolos o textos que ayudan a identificar lugares, direcciones o servicios cercanos, como hospitales, gasolineras o parkings.
//""",
//        // Informative signs provide useful information to drivers about services, directions, or specific road characteristics.
//        // They do not impose obligations or prohibitions but help guide and facilitate driving.
//        // These signs usually have a blue or white background with symbols or text indicating places, directions, or nearby services such as hospitals, gas stations, or parking areas.
//        subSections:
//            [
//                TrafficSubSection(
//                    index: 0,
//                    name: "Señales Generales",
//                    description: "Proporcionan información útil para la conducción, como direcciones, destinos, lugares de interés o condiciones de la vía. Ayudan al conductor a orientarse y circular con seguridad.",
//                    signs: [
//                        TrafficSign(
//                            title: "Inicio de autopista",
//                            description: "Señal de inicio de autopista en España y Andorra, utilizado en autopistas.", // Beginning of Motorway sign in Spain and Andorra, used on motorways
//                            images: ["S1"],
//                            wrongAnswers: [
//                                "Fin de autopista", // End of Motorway
//                                "Carretera con prioridad", // Priority road
//                                "Zona de estacionamiento limitado", // Limited parking zone
//                                "Entrada prohibida", // No entry
//                                "Ceda el paso", // Yield
//                                "Stop", // Stop
//                                "Velocidad máxima", // Maximum speed
//                                "Prohibido adelantar" // No overtaking
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Indicaciones Generales"
//                        ),
//                        // Subcategory: Señales de Indicaciones Generales
//                        TrafficSign(
//                            title: "Inicio de autovía", // Beginning of expressway
//                            description: "Señal que indica el inicio de una autovía o carretera para automóviles. En España puede aparecer con el texto 'Autobía' o 'Autovía' según la variante.",
//                            images: ["S1a", "S1aEU"],
//                            wrongAnswers: [
//                                "Inicio de autopista", // Beginning of motorway
//                                "Fin de autovía", // End of expressway
//                                "Carretera convencional", // Conventional road
//                                "Zona urbana", // Urban area
//                                "Prohibido automóviles", // Cars prohibited
//                                "Carretera de servicio", // Service road
//                                "Vía ciclista", // Bicycle lane
//                                "Camino para peatones" // Pedestrian path
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Indicaciones Generales"
//                        ),
//                        TrafficSign(
//                            title: "Autopista de varios carriles", // Multi-lane motorway
//                            description: "Indica el inicio de una autopista de varios carriles.", // Indicates the start of a multi-lane motorway
//                            images: ["S1b"],
//                            wrongAnswers: [
//                                "Inicio de autopista", // Beginning of Motorway
//                                "Inicio de autovía", // Beginning of expressway
//                                "Fin de autopista", // End of Motorway
//                                "Carretera convencional", // Conventional road
//                                "Zona urbana", // Urban area
//                                "Carretera de servicio", // Service road
//                                "Vía ciclista", // Bicycle lane
//                                "Camino para peatones" // Pedestrian path
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Indicaciones Generales"
//                        ),
//                        // Subcategory: Señales de Indicaciones Generales
//                        TrafficSign(
//                            title: "Inicio de carretera 2+1", // Beginning of 2+1 road
//                            description: "Indica el inicio de una carretera con configuración 2+1, donde se alternan dos carriles en un sentido y uno en el contrario para facilitar los adelantamientos.",
//                            images: ["S1c"],
//                            wrongAnswers: [
//                                "Inicio de autopista", // Beginning of motorway
//                                "Fin de autopista", // End of motorway
//                                "Inicio de autovía", // Beginning of expressway
//                                "Fin de autovía", // End of expressway
//                                "Carretera de calzada única", // Single carriageway
//                                "Zona urbana", // Urban area
//                                "Área de servicio", // Service area
//                                "Intersección con prioridad" // Priority intersection
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Indicaciones Generales"
//                        ),
//                        TrafficSign(
//                            title: "Fin de autopista", // End of motorway
//                            description: "Señala el lugar donde finaliza una autopista. A partir de este punto dejan de aplicarse las normas específicas de las autopistas.",
//                            images: ["S2"],
//                            wrongAnswers: [
//                                "Inicio de autopista", // Beginning of motorway
//                                "Fin de autovía", // End of expressway
//                                "Inicio de autovía", // Beginning of expressway
//                                "Carretera de calzada única", // Single carriageway
//                                "Zona urbana", // Urban area
//                                "Área de servicio", // Service area
//                                "Fin de prohibición de adelantamiento", // End of overtaking prohibition
//                                "Ceda el paso" // Yield
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Indicaciones Generales"
//                        ),
//                        TrafficSign(
//                            title: "Fin de autovía", // End of expressway
//                            description: "Señal que indica el fin de una autovía o carretera para automóviles. En España puede aparecer con el texto 'Autobía' o 'Autovía' según la variante.",
//                            images: ["S2a", "S2aEU"],
//                            wrongAnswers: [
//                                "Inicio de autovía", // Beginning of expressway
//                                "Inicio de autopista", // Beginning of motorway
//                                "Fin de autopista", // End of motorway
//                                "Carretera convencional", // Conventional road
//                                "Zona urbana", // Urban area
//                                "Área de servicio", // Service area
//                                "Ceda el paso", // Yield
//                                "Stop" // Stop
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Indicaciones Generales"
//                        ),
//                        TrafficSign(
//                            title: "Fin de multicarril", // End of multi-lane
//                            description: "Indica el fin de una autopista o carretera de varios carriles.", // Indicates the end of a multi-lane motorway or road
//                            images: ["S2b"],
//                            wrongAnswers: [
//                                "Fin de autopista", // End of motorway
//                                "Fin de autovía", // End of expressway
//                                "Inicio de autopista", // Beginning of motorway
//                                "Inicio de autovía", // Beginning of expressway
//                                "Autopista de varios carriles", // Multi-lane motorway
//                                "Carretera convencional", // Conventional road
//                                "Zona urbana", // Urban area
//                                "Área de servicio" // Service area
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Indicaciones Generales"
//                        ),
//                        TrafficSign(
//                            title: "Fin de carretera 2+1", // End of road 2+1
//                            description: "Indica el fin de una carretera con configuración 2+1.", // Indicates the end of a 2+1 road configuration
//                            images: ["S2c"],
//                            wrongAnswers: [
//                                "Fin de autopista", // End of motorway
//                                "Fin de autovía", // End of expressway
//                                "Fin de multicarril", // End of multi-lane
//                                "Inicio de carretera 2+1", // Beginning of 2+1 road
//                                "Inicio de autopista", // Beginning of motorway
//                                "Inicio de autovía", // Beginning of expressway
//                                "Carretera convencional", // Conventional road
//                                "Zona urbana" // Urban area
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Indicaciones Generales"
//                        ),
//                        TrafficSign(
//                            title: "Carretera para automóviles", // Road for motor vehicles
//                            description: "Indica el inicio de una carretera reservada exclusivamente para automóviles, excluyendo a ciclomotores, bicicletas, peatones y otros vehículos no autorizados.", // Indicates the beginning of a road reserved only for motor vehicles
//                            images: ["S3"],
//                            wrongAnswers: [
//                                "Inicio de autopista", // Beginning of motorway
//                                "Inicio de autovía", // Beginning of expressway
//                                "Fin de autopista", // End of motorway
//                                "Fin de autovía", // End of expressway
//                                "Carretera convencional", // Conventional road
//                                "Vía ciclista", // Bicycle lane
//                                "Camino para peatones", // Pedestrian path
//                                "Prohibido automóviles" // Cars prohibited
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Indicaciones Generales"
//                        ),
//                        // Subcategory: Señales de Indicaciones Generales
//                        TrafficSign(
//                            title: "Fin de carretera para automóviles", // End of road for motor vehicles
//                            description: "Indica el fin de una carretera reservada exclusivamente para automóviles. A partir de este punto pueden circular otros vehículos no autorizados anteriormente.", // Indicates the end of a road reserved exclusively for motor vehicles
//                            images: ["S4"],
//                            wrongAnswers: [
//                                "Carretera para automóviles", // Road for motor vehicles
//                                "Inicio de autopista", // Beginning of motorway
//                                "Inicio de autovía", // Beginning of expressway
//                                "Fin de autopista", // End of motorway
//                                "Fin de autovía", // End of expressway
//                                "Carretera convencional", // Conventional road
//                                "Vía ciclista", // Bicycle lane
//                                "Camino para peatones" // Pedestrian path
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Indicaciones Generales"
//                        ),
//                        TrafficSign(
//                            title: "Túnel", // Tunnel
//                            description: "Indica la proximidad o la entrada a un túnel. Los conductores deben encender las luces de cruce y respetar las normas específicas de circulación en túneles.", // Indicates the entrance or proximity to a tunnel
//                            images: ["S5"],
//                            wrongAnswers: [
//                                "Carretera para automóviles", // Road for motor vehicles
//                                "Inicio de autopista", // Beginning of motorway
//                                "Inicio de autovía", // Beginning of expressway
//                                "Fin de autopista", // End of motorway
//                                "Fin de autovía", // End of expressway
//                                "Carretera convencional", // Conventional road
//                                "Zona urbana", // Urban area
//                                "Área de servicio" // Service area
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Indicaciones Generales"
//                        ),
//                        // Subcategory: Señales de Indicaciones Generales
//                        TrafficSign(
//                            title: "Fin de túnel", // End of tunnel
//                            description: "Indica el lugar donde finaliza un túnel o paso subterráneo señalizado anteriormente.", // Indicates the place where a tunnel or underpass previously signaled ends
//                            images: ["S6"],
//                            wrongAnswers: [
//                                "Túnel", // Tunnel
//                                "Inicio de autopista", // Beginning of motorway
//                                "Fin de autopista", // End of motorway
//                                "Carretera para automóviles", // Road for motor vehicles
//                                "Fin de carretera para automóviles", // End of road for motor vehicles
//                                "Zona urbana", // Urban area
//                                "Fin de multicarril", // End of multi-lane road
//                                "Zona de estacionamiento" // Parking area
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Indicaciones Generales"
//                        ),
//                        // Subcategory: Señales de Indicaciones Generales
//                        TrafficSign(
//                            title: "Velocidad aconsejable", // Advisory speed limit
//                            description: "Señal de límite de velocidad aconsejable en España y Andorra. Indica la velocidad recomendada (entre 10 km/h y 120 km/h) que se aconseja no superar en condiciones normales de circulación.",
//                            images: ["S7_10", "S7_20", "S7_30", "S7_40", "S7_50", "S7_60", "S7_70", "S7_80", "S7_90", "S7_100", "S7_110", "S7_120"],
//                            wrongAnswers: [
//                                "Carretera convencional", // Conventional road
//                                "Zona urbana", // Urban area
//                                "Distancia mínima obligatoria", // Minimum distance
//                                "Stop", // Stop
//                                "Ceda el paso", // Yield
//                                "Entrada prohibida", // No entry
//                                "Prohibido adelantar", // No overtaking
//                                "Prohibido estacionar" // No parking
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Indicaciones Generales"
//                        ),
//                        TrafficSign(
//                            title: "Fin de velocidad aconsejable", // End of advisory speed limit
//                            description: "Indica el fin de un tramo con limitación de velocidad aconsejable. A partir de este punto deja de aplicarse la recomendación de velocidad señalada.", // Indicates the end of a section with an advisory speed limit
//                            images: ["S8"],
//                            wrongAnswers: [
//                                "Velocidad aconsejable", // Advisory speed limit
//                                "Velocidad máxima", // Maximum speed
//                                "Velocidad mínima", // Minimum speed
//                                "Fin de autopista", // End of motorway
//                                "Zona urbana", // Urban area
//                                "Carretera convencional", // Conventional road
//                                "Stop", // Stop
//                                "Ceda el paso" // Yield
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Indicaciones Generales"
//                        ),
//                        TrafficSign(
//                            title: "Intervalo aconsejado de velocidades", // Recommended speed range
//                            description: "Indica un intervalo de velocidad aconsejable para circular en un tramo de la vía. Recomienda una velocidad mínima y máxima dentro de ese intervalo en condiciones normales de circulación.", // Indicates an advisory speed interval, showing both minimum and maximum recommended speeds
//                            images: ["S9"],
//                            wrongAnswers: [
//                                "Velocidad aconsejable", // Advisory speed limit
//                                "Fin de velocidad aconsejable", // End of advisory speed limit
//                                "Velocidad máxima", // Maximum speed
//                                "Velocidad mínima", // Minimum speed
//                                "Carretera convencional", // Conventional road
//                                "Zona urbana", // Urban area
//                                "Stop", // Stop
//                                "Ceda el paso" // Yield
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Indicaciones Generales"
//                        ),
//                        TrafficSign(
//                            title: "Fin de intervalo aconsejado de velocidades", // End of advisory speed range
//                            description: "Indica el fin de un tramo con intervalo aconsejado de velocidades. A partir de este punto deja de aplicarse la recomendación de velocidad mínima y máxima señalada.", // Marks where an advisory speed interval no longer applies
//                            images: ["S10"],
//                            wrongAnswers: [
//                                "Fin de vía reservada para ciclos", // End of road reserved for bicycles
//                                "Fin de vía reservada para ciclomotores", // End of road reserved for mopeds
//                                "Fin de tramo de adelantamiento", // End of overtaking section
//                                "Fin de calzada con prioridad", // End of priority road
//                                "Fin de prohibición de adelantamiento", // End of no-overtaking restriction
//                                "Fin de obligación de cadenas para nieve", // End of snow chain requirement
//                                "Fin de túnel", // End of tunnel
//                                "Fin de zona peatonal" // End of pedestrian zone
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Indicaciones Generales"
//                        ),
//                        // Subcategory: Señales de Indicaciones Generales
//                        TrafficSign(
//                            title: "Sentido único", // One-way road
//                            description: "Indica que la circulación en la vía es de un solo sentido. Puede mostrarse con una, dos, tres o más flechas para reflejar la configuración de los carriles.",
//                            images: ["S11", "S11a", "S11b", "S11c"],
//                            wrongAnswers: [
//                                "Prohibido el paso", // No entry
//                                "Dirección obligatoria", // Mandatory direction
//                                "Carretera de doble sentido", // Two-way road
//                                "Ceda el paso", // Yield
//                                "Autopista", // Motorway
//                                "Autovía", // Expressway
//                                "Fin de autopista", // End of motorway
//                                "Fin de autovía" // End of expressway
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Indicaciones Generales"
//                        ),
//                        TrafficSign(
//                            title: "Tramo de calzada de sentido único", // One-way track section
//                            description: "Indica un tramo de calzada de sentido único. En este tramo, los vehículos deben circular únicamente en la dirección indicada por la flecha, quedando prohibida la circulación en sentido contrario.", // Indicates a section of road where vehicles must drive only in the direction indicated by the arrow, and driving in the opposite direction is prohibited.
//                            images: ["S12"],
//                            wrongAnswers: [
//                                "Prohibido el paso", // No entry
//                                "Dirección obligatoria", // Mandatory direction
//                                "Carretera de doble sentido", // Two-way road
//                                "Zona urbana", // Urban area
//                                "Autopista", // Motorway
//                                "Autovía", // Expressway
//                                "Carretera convencional", // Conventional road
//                                "Cambio de sentido" // U-turn
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Indicaciones Generales"
//                        ),
//                        // Subcategory: Señales de Indicaciones Generales
//                        TrafficSign(
//                            title: "Situación de un paso para peatones", // Pedestrian crossing location
//                            description: "Indica la situación de un paso para peatones. Señal conforme al proyecto de Real Decreto por el que se modifica el Reglamento General de Circulación, aprobado por Real Decreto 1428/2003, de 21 de noviembre, en materia de señalización de tráfico.", // Specifies the location of a pedestrian crossing
//                            images: ["S13"],
//                            wrongAnswers: [
//                                "Área de servicio", // Service area
//                                "Carretera convencional", // Conventional road
//                                "Fin de autopista", // End of motorway
//                                "Fin de autovía", // End of expressway
//                                "Zona urbana", // Urban area
//                                "Gasolinera", // Petrol station
//                                "Intersección con prioridad", // Priority intersection
//                                "Parking" // Parking
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Indicaciones Generales"
//                        ),
//                        TrafficSign(
//                            title: "Paso elevado para peatones", // Pedestrian overpass
//                            description: "Indica la existencia de un paso elevado para peatones en la vía. Utilizado para advertir a los conductores y guiar a los peatones hacia el paso seguro.", // Indicates the presence of a pedestrian overpass for safe crossing
//                            images: ["S14a"],
//                            wrongAnswers: [
//                                "Área de descanso", // Rest area
//                                "Carretera convencional", // Conventional road
//                                "Fin de autopista", // End of motorway
//                                "Fin de autovía", // End of expressway
//                                "Zona urbana", // Urban area
//                                "Gasolinera", // Petrol station
//                                "Intersección con prioridad", // Priority intersection
//                                "Parking" // Parking
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Indicaciones Generales"
//                        ),
//                        TrafficSign(
//                            title: "Paso subterráneo para peatones", // Pedestrian underpass
//                            description: "Indica la existencia de un paso subterráneo para peatones, utilizado para advertir a los conductores y guiar a los peatones hacia un cruce subterráneo seguro.", // Indicates the presence of a pedestrian underpass, guiding pedestrians to a safe underground crossing.
//                            images: ["S14b"],
//                            wrongAnswers: [
//                                "Paso elevado para peatones", // Pedestrian overpass
//                                "Carretera convencional", // Conventional road
//                                "Fin de autovía", // End of expressway
//                                "Gasolinera", // Petrol station
//                                "Zona urbana", // Urban area
//                                "Intersección con prioridad", // Priority intersection
//                                "Parking", // Parking
//                                "Túnel" // Tunnel
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Indicaciones Generales"
//                        ),
//                        TrafficSign(
//                            title: "Paso superior para peatones con rampa", // Pedestrian overpass with ramp
//                            description: "Indica la existencia de un paso elevado para peatones con rampa, diseñado para facilitar el acceso a personas con movilidad reducida.", // Indicates the presence of a pedestrian overpass with a ramp, designed to provide accessibility for people with reduced mobility.
//                            images: ["S14c"],
//                            wrongAnswers: [
//                                "Área de descanso", // Rest area
//                                "Fin de autopista", // End of motorway
//                                "Gasolinera", // Petrol station
//                                "Carretera convencional", // Conventional road
//                                "Zona urbana", // Urban area
//                                "Intersección con prioridad", // Priority intersection
//                                "Parking", // Parking
//                                "Túnel" // Tunnel
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Indicaciones Generales"
//                        ),
//                        TrafficSign(
//                            title: "Paso inferior para peatones con rampa", // Pedestrian underpass with ramp
//                            description: "Indica la existencia de un paso subterráneo para peatones con rampa, que facilita el cruce seguro de la vía a personas con movilidad reducida.", // Indicates the presence of a pedestrian underpass with a ramp, facilitating safe crossing for people with reduced mobility.
//                            images: ["S14d"],
//                            wrongAnswers: [
//                                "Área de servicio", // Service area
//                                "Carretera convencional", // Conventional road
//                                "Fin de autovía", // End of expressway
//                                "Gasolinera", // Petrol station
//                                "Zona urbana", // Urban area
//                                "Intersección con prioridad", // Priority intersection
//                                "Parking", // Parking
//                                "Túnel" // Tunnel
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Indicaciones Generales"
//                        ),
//                        TrafficSign(
//                            title: "Paso superior para peatones con raíl para ciclos", // Pedestrian overpass with rail for bicycles
//                            description: "Indica la existencia de un paso elevado para peatones equipado con un raíl que facilita el paso de bicicletas, mejorando la accesibilidad de ciclistas y peatones.", // Indicates the presence of a pedestrian overpass equipped with a rail for bicycles, improving accessibility for cyclists and pedestrians.
//                            images: ["S14e"],
//                            wrongAnswers: [
//                                "Área de descanso", // Rest area
//                                "Fin de autopista", // End of motorway
//                                "Gasolinera", // Petrol station
//                                "Carretera convencional", // Conventional road
//                                "Zona urbana", // Urban area
//                                "Intersección con prioridad", // Priority intersection
//                                "Parking", // Parking
//                                "Túnel" // Tunnel
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Indicaciones Generales"
//                        ),
//                        TrafficSign(
//                            title: "Paso inferior para peatones con raíl para ciclos", // Pedestrian underpass with rail for bicycles
//                            description: "Indica la existencia de un paso subterráneo para peatones con raíl que facilita el paso de bicicletas, mejorando la accesibilidad y seguridad en el cruce de la vía.", // Indicates the presence of a pedestrian underpass equipped with a rail for bicycles, improving accessibility and safety for road users.
//                            images: ["S14f"],
//                            wrongAnswers: [
//                                "Área de servicio", // Service area
//                                "Fin de autovía", // End of expressway
//                                "Gasolinera", // Petrol station
//                                "Carretera convencional", // Conventional road
//                                "Zona urbana", // Urban area
//                                "Intersección con prioridad", // Priority intersection
//                                "Parking", // Parking
//                                "Túnel" // Tunnel
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Indicaciones Generales"
//                        ),
//                        TrafficSign(
//                            title: "Calle sin salida", // Dead-end street
//                            description: "Indica una calle o vía sin salida para vehículos. Puede especificar su localización a la derecha, a la izquierda o en forma de T.", // Indicates a dead-end street for vehicles, possibly specifying its position to the right, left, or in T-shape.
//                            images: ["S15a", "S15b", "S15c", "S15d"],
//                            wrongAnswers: [
//                                "Calle con salida", // Street with exit
//                                "Carretera de doble sentido", // Two-way road
//                                "Prohibido el paso", // No entry
//                                "Intersección con prioridad", // Priority intersection
//                                "Zona urbana", // Urban area
//                                "Carretera convencional", // Conventional road
//                                "Parking", // Parking
//                                "Ceda el paso" // Yield
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Indicaciones Generales"
//                        ),
//                        TrafficSign(
//                            title: "Calzada sin salida excepto para peatones o ciclos", // Dead-end road except for pedestrians or bicycles
//                            description: "Indica una calzada sin salida excepto para peatones o ciclos, permitiendo únicamente el acceso a estos usuarios en el tramo final de la vía.", // Indicates a dead-end road except for pedestrians or bicycles, allowing only their passage at the end of the road.
//                            images: ["S15e"],
//                            wrongAnswers: [
//                                "Calle sin salida", // Dead-end street
//                                "Carretera de doble sentido", // Two-way road
//                                "Prohibido el paso", // No entry
//                                "Intersección con prioridad", // Priority intersection
//                                "Zona urbana", // Urban area
//                                "Carretera convencional", // Conventional road
//                                "Parking", // Parking
//                                "Ceda el paso" // Yield
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Indicaciones Generales"
//                        ),
//                        TrafficSign(
//                            title: "Zona de frenado de emergencia", // Emergency braking zone
//                            description: "Indica la ubicación de una zona de escape en la carretera, preparada para que un vehículo pueda detenerse en caso de fallo de su sistema de frenado.", // Indicates the location of an escape zone on the road, prepared so that a vehicle can be stopped in case of brake failure
//                            images: ["S16"],
//                            wrongAnswers: [
//                                "Área de descanso",              // Rest area
//                                "Zona de carga y descarga",      // Loading and unloading zone
//                                "Carretera con pendiente",       // Road with slope
//                                "Estacionamiento",               // Parking
//                                "Fin de autopista",              // End of motorway
//                                "Fin de autovía",                // End of expressway
//                                "Gasolinera",                    // Petrol station
//                                "Área de servicio"               // Service area
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Indicaciones Generales"
//                        ),
//                        TrafficSign(
//                            title: "Estacionamiento", // Parking
//                            description: "Indica un lugar habilitado para el estacionamiento de vehículos.", // Indicates a designated parking area for vehicles
//                            images: ["S17", "S17a"],
//                            wrongAnswers: [
//                                "Área de descanso",          // Rest area
//                                "Zona de carga y descarga",  // Loading and unloading zone
//                                "Prohibido estacionar",      // No parking
//                                "Garaje privado",            // Private garage
//                                "Gasolinera",                // Petrol station
//                                "Aparcamiento para bicicletas", // Bicycle parking
//                                "Área de servicio",          // Service area
//                                "Parada de autobús"          // Bus stop
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Indicaciones Generales"
//                        ),
//                        // Subcategory: Señales de Indicaciones Generales
//                        TrafficSign(
//                            title: "Lugar reservado para taxis", // Place reserved for taxis
//                            description: "Indica el lugar donde los taxis libres y en servicio pueden parar o estacionar. La inscripción de una cifra indica el número total de plazas reservadas para este fin.", // Indicates the place where free and in-service taxis can stop or park
//                            images: ["S18"],
//                            wrongAnswers: [
//                                "Parada de autobús", // Bus stop
//                                "Parada de tranvía", // Tram stop
//                                "Aparcamiento público", // Public parking
//                                "Zona de carga y descarga", // Loading/unloading zone
//                                "Carretera convencional", // Conventional road
//                                "Estación de tren", // Train station
//                                "Área de descanso", // Rest area
//                                "Gasolinera" // Petrol station
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Indicaciones Generales"
//                        ),
//                        TrafficSign(
//                            title: "Parada de autobús", // Bus stop
//                            description: "Indica el lugar reservado para la parada de autobuses. Señal utilizada para informar a los conductores y peatones de la ubicación exacta de la parada.", // Indicates the place reserved for a bus stop
//                            images: ["S19"],
//                            wrongAnswers: [
//                                "Lugar reservado para taxis", // Taxi stand
//                                "Parada de tranvía", // Tram stop
//                                "Aparcamiento público", // Public parking
//                                "Zona de carga y descarga", // Loading/unloading zone
//                                "Área de servicio", // Service area
//                                "Carretera convencional", // Conventional road
//                                "Fin de autopista", // End of motorway
//                                "Gasolinera" // Petrol station
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Indicaciones Generales"
//                        ),
//                        TrafficSign(
//                            title: "Parada de tranvía", // Tram stop
//                            description: "Indica el lugar reservado para la parada de tranvías. Utilizada en zonas urbanas donde opera el servicio de tranvía.", // Indicates the place reserved for a tram stop
//                            images: ["S20"],
//                            wrongAnswers: [
//                                "Parada de autobús", // Bus stop
//                                "Lugar reservado para taxis", // Taxi stand
//                                "Aparcamiento público", // Public parking
//                                "Zona de carga y descarga", // Loading/unloading zone
//                                "Estación de tren", // Train station
//                                "Área de descanso", // Rest area
//                                "Carretera convencional", // Conventional road
//                                "Gasolinera" // Petrol station
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Indicaciones Generales"
//                        ),
//                        TrafficSign(
//                            title: "Transitabilidad en tramo o puerto de montaña", // Traffic conditions on mountain section or pass
//                            description: "Informa sobre la transitabilidad en un tramo o puerto de montaña, indicando si el paso está abierto, requiere cadenas o está cerrado por condiciones meteorológicas.", // Informs about traffic conditions on a mountain road section or pass, indicating whether the passage is open, requires snow chains, or is closed due to weather conditions
//                            images: ["S21"],
//                            wrongAnswers: [
//                                "Zona de obras", // Roadworks area
//                                "Carretera cortada", // Road closed
//                                "Velocidad aconsejable", // Advisory speed
//                                "Área de descanso", // Rest area
//                                "Gasolinera", // Petrol station
//                                "Fin de autopista", // End of motorway
//                                "Desvío provisional", // Temporary detour
//                                "Túnel" // Tunnel
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Indicaciones Generales"
//                        ),
//                        TrafficSign(
//                            title: "Cambio de sentido al mismo nivel", // Same-level U-turn
//                            description: "Indica la existencia de un lugar habilitado para realizar un cambio de sentido al mismo nivel.", // Indicates the location of a designated area for making a same-level U-turn
//                            images: ["S22"],
//                            wrongAnswers: [
//                                "Cambio de sentido a distinto nivel", // U-turn at different level
//                                "Glorieta", // Roundabout
//                                "Intersección con prioridad", // Priority intersection
//                                "Fin de autopista", // End of motorway
//                                "Entrada prohibida", // No entry
//                                "Carril de aceleración", // Acceleration lane
//                                "Carril de deceleración", // Deceleration lane
//                                "Zona urbana" // Urban area
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Indicaciones Generales"
//                        ),
//                        TrafficSign(
//                            title: "Hospital", // Hospital
//                            description: "Indica a todos los conductores la conveniencia de tomar las precauciones necesarias por la proximidad de establecimientos médicos, especialmente para evitar hacer ruido.", // Informs all drivers to take precautions due to the proximity of medical establishments, especially to avoid making noise
//                            images: ["S23"],
//                            wrongAnswers: [
//                                "Zona escolar", // School zone
//                                "Área de descanso", // Rest area
//                                "Estación de servicio", // Service station
//                                "Aparcamiento", // Parking
//                                "Cruce con prioridad", // Priority intersection
//                                "Fin de autopista", // End of motorway
//                                "Túnel" // Tunnel
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Indicaciones Generales"
//                        ),
//                        TrafficSign(
//                            title: "Fin de obligación de alumbrado de cruce", // End of low-beam headlights obligation
//                            description: "Indica el final de un tramo de vía en el que era obligatorio el uso del alumbrado de cruce y recuerda la posibilidad de prescindir de él siempre que las condiciones de visibilidad, horario o iluminación de la vía lo permitan.", // Indicates the end of a road section where the use of low-beam headlights was mandatory and reminds drivers they may turn them off if visibility conditions allow
//                            images: ["S24"],
//                            wrongAnswers: [
//                                "Inicio de obligación de alumbrado de cruce", // Start of low-beam headlights obligation
//                                "Fin de autopista", // End of motorway
//                                "Túnel", // Tunnel
//                                "Zona de obras", // Construction zone
//                                "Área de servicio", // Service area
//                                "Carril de aceleración", // Acceleration lane
//                                "Cambio de sentido al mismo nivel", // Same-level U-turn
//                                "Intersección con prioridad" // Priority intersection
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Indicaciones Generales"
//                        ),
//                        TrafficSign(
//                            title: "Cambio de sentido a distinto nivel", // Change of direction at different level
//                            description: "Indica la proximidad de una salida mediante la cual puede realizarse un cambio de sentido a distinto nivel.", // Indicates the proximity of an exit where a change of direction can be made at a different level
//                            images: ["S25"],
//                            wrongAnswers: [
//                                "Cambio de sentido al mismo nivel", // Same-level U-turn
//                                "Glorieta", // Roundabout
//                                "Intersección con prioridad", // Priority intersection
//                                "Carril de aceleración", // Acceleration lane
//                                "Fin de autopista", // End of motorway
//                                "Entrada prohibida", // No entry
//                                "Zona urbana", // Urban area
//                                "Área de descanso" // Rest area
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Indicaciones Generales"
//                        ),
//                        // Subcategory: Señales de Indicaciones Generales
//                        TrafficSign(
//                            title: "Panel de aproximación de salida", // Exit approach panel
//                            description: "Indica en autopista, autovía o carretera de doble calzada que la siguiente salida se encuentra aproximadamente a 300, 200 y 100 metros, respectivamente, según la variante de la señal.", // Indicates on a motorway, dual carriageway or main road that the next exit is approximately 300, 200, or 100 meters away, depending on the variant
//                            images: ["S26a", "S26b", "S26c"],
//                            wrongAnswers: [
//                                "Panel de dirección de destino", // Destination direction panel
//                                "Fin de autopista", // End of motorway
//                                "Cambio de sentido a distinto nivel", // Change of direction at different level
//                                "Área de servicio", // Service area
//                                "Entrada a autopista", // Motorway entry
//                                "Zona de descanso", // Rest area
//                                "Túnel", // Tunnel
//                                "Carril de aceleración" // Acceleration lane
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Indicaciones Generales"
//                        ),
//                        // Subcategory: Señales de Indicaciones Generales
//                        TrafficSign(
//                            title: "Asistencia en carretera", // Road assistance
//                            description: "Indica la ubicación del punto de auxilio o estación de ayuda más cercana donde se puede solicitar asistencia en caso de accidente o avería. La señal puede indicar la distancia al punto de ayuda.", // Indicates the location of the nearest help or aid station where assistance can be requested in case of accident or breakdown
//                            images: ["S27"],
//                            wrongAnswers: [
//                                "Área de servicio", // Service area
//                                "Gasolinera", // Petrol station
//                                "Hospital", // Hospital
//                                "Zona de descanso", // Rest area
//                                "Estación de autobuses", // Bus station
//                                "Taller mecánico", // Workshop
//                                "Parking", // Parking
//                                "Teléfono de emergencia" // Emergency phone
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Indicaciones Generales"
//                        ),
//                        TrafficSign(
//                            title: "Zona residencial", // Residential area
//                            description: "Indica áreas de tráfico especialmente acondicionadas y destinadas principalmente a peatones, donde se aplican normas especiales: la velocidad máxima es de 20 km/h, los conductores deben dar prioridad a los peatones, y el estacionamiento solo se permite en lugares señalizados.", // Indicates specially conditioned traffic areas primarily for pedestrians, with special rules: max speed 20 km/h, drivers must yield to pedestrians, and parking is only allowed in designated places
//                            images: ["S28"],
//                            wrongAnswers: [
//                                "Zona escolar", // School zone
//                                "Zona peatonal", // Pedestrian zone
//                                "Zona urbana", // Urban area
//                                "Fin de autopista", // End of motorway
//                                "Área de servicio", // Service area
//                                "Zona de descanso", // Rest area
//                                "Calle sin salida", // Dead end street
//                                "Carretera convencional" // Conventional road
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Indicaciones Generales"
//                        ),
//                        TrafficSign(
//                            title: "Fin de zona residencial", // End of residential area
//                            description: "Indica que vuelven a aplicarse las normas generales de circulación y termina la prioridad peatonal y la limitación de velocidad de la zona residencial.", // Indicates that general traffic regulations apply again and pedestrian priority and reduced speed limit end
//                            images: ["S29"],
//                            wrongAnswers: [
//                                "Zona residencial", // Residential area
//                                "Zona peatonal", // Pedestrian zone
//                                "Zona escolar", // School zone
//                                "Área de descanso", // Rest area
//                                "Fin de autopista", // End of motorway
//                                "Calle sin salida", // Dead end street
//                                "Gasolinera", // Petrol station
//                                "Parking" // Parking
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Indicaciones Generales"
//                        ),
//                        TrafficSign(
//                            title: "Zona peatonal", // Pedestrian zone
//                            description: "Señal conforme al proyecto de Real Decreto por el que se modifica el Reglamento General de Circulación, aprobado por Real Decreto 1428/2003, de 21 de noviembre, en materia de señalización de tráfico.", // Sign in accordance with the draft Royal Decree amending the General Traffic Regulations, approved by Royal Decree 1428/2003, of November 21, regarding traffic signage
//                            images: ["S30a"],
//                            wrongAnswers: [
//                                "Zona residencial", // Residential area
//                                "Zona escolar", // School zone
//                                "Zona de descanso", // Rest area
//                                "Área de servicio", // Service area
//                                "Calle sin salida", // Dead-end street
//                                "Fin de autopista", // End of motorway
//                                "Carretera convencional", // Conventional road
//                                "Parking" // Parking
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Indicaciones Generales"
//                        ),
//                        TrafficSign(
//                            title: "Fin de zona peatonal", // End of pedestrian zone
//                            description: "Señal conforme al proyecto de Real Decreto por el que se modifica el Reglamento General de Circulación, aprobado por Real Decreto 1428/2003, de 21 de noviembre, en materia de señalización de tráfico.", // Sign in accordance with the draft Royal Decree amending the General Traffic Regulations, approved by Royal Decree 1428/2003, of November 21, regarding traffic signage
//                            images: ["S31a"],
//                            wrongAnswers: [
//                                "Zona peatonal", // Pedestrian zone
//                                "Zona residencial", // Residential area
//                                "Zona escolar", // School zone
//                                "Área de servicio", // Service area
//                                "Zona de descanso", // Rest area
//                                "Calle sin salida", // Dead-end street
//                                "Fin de autopista", // End of motorway
//                                "Carretera convencional" // Conventional road
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Indicaciones Generales"
//                        ),
//                        TrafficSign(
//                            title: "Peaje electrónico", // Electronic toll
//                            description: "Indica que el vehículo que circule por el carril o los carriles así señalizados puede efectuar el pago del peaje mediante sistema dinámico o medios de telepeaje, siempre que disponga del equipo técnico necesario que permita su uso.", // Indicates that vehicles using the lane(s) marked with this sign can pay the toll electronically if equipped with the required device.
//                            images: ["S32"],
//                            wrongAnswers: [
//                                "Peaje manual", // Manual toll
//                                "Área de descanso", // Rest area
//                                "Gasolinera", // Petrol station
//                                "Carretera convencional", // Conventional road
//                                "Fin de autopista", // End of motorway
//                                "Zona urbana", // Urban area
//                                "Intersección con prioridad", // Priority intersection
//                                "Parking" // Parking
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Indicaciones Generales"
//                        ),
//                        TrafficSign(
//                            title: "Senda ciclable", // Cycle path
//                            description: "Indica una senda destinada principalmente a la circulación de bicicletas, separada del tráfico motorizado y acondicionada para el tránsito seguro de ciclistas.", // Indicates a path primarily intended for bicycles, separated from motorized traffic and designed for safe cycling.
//                            images: ["S33"],
//                            wrongAnswers: [
//                                "Carril bus", // Bus lane
//                                "Carretera convencional", // Conventional road
//                                "Zona peatonal", // Pedestrian zone
//                                "Peaje electrónico", // Electronic toll
//                                "Área de descanso", // Rest area
//                                "Gasolinera", // Petrol station
//                                "Parking", // Parking
//                                "Carretera con prioridad" // Priority road
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Indicaciones Generales"
//                        ),
//                        TrafficSign(
//                            title: "Apartadero en túnel", // Siding in tunnels
//                            description: "Indica la ubicación de un lugar donde el vehículo puede apartarse en un túnel para despejar la vía. Utilizada para mejorar la seguridad y la fluidez del tráfico en caso de emergencia o avería.", // Indicates the location of a place where a vehicle can pull over in a tunnel to clear the way, improving safety and traffic flow in case of emergency or breakdown.
//                            images: ["S34"],
//                            wrongAnswers: [
//                                "Teléfono de emergencia", // Emergency telephone
//                                "Salida de emergencia", // Emergency exit
//                                "Zona de frenado de emergencia", // Emergency braking area
//                                "Gasolinera", // Petrol station
//                                "Área de descanso", // Rest area
//                                "Parking", // Parking
//                                "Peaje", // Toll
//                                "Carretera convencional" // Conventional road
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Indicaciones Generales"
//                        ),
//                        TrafficSign(
//                            title: "Apartadero de emergencia en túnel", // Emergency siding in tunnels
//                            description: "Indica la ubicación de un lugar donde el vehículo puede apartarse en un túnel para despejar la vía y donde se dispone de un teléfono de emergencia. Destinada a situaciones de avería o emergencia.", // Indicates the location of a place where a vehicle can pull over in a tunnel to clear the way, and where an emergency telephone is available. Intended for breakdown or emergency situations.
//                            images: ["S34a"],
//                            wrongAnswers: [
//                                "Apartadero en túnel", // Siding in tunnels
//                                "Teléfono de emergencia", // Emergency telephone
//                                "Salida de emergencia", // Emergency exit
//                                "Zona de frenado de emergencia", // Emergency braking area
//                                "Área de descanso", // Rest area
//                                "Gasolinera", // Petrol station
//                                "Parking", // Parking
//                                "Peaje" // Toll
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Indicaciones Generales"
//                        ),
//                        TrafficSign(
//                            title: "Vía ciclista no obligatoria", // Non-mandatory bicycleway
//                            description: "Aunque a fecha de mayo de 2019 esta señal no implica legalmente la obligación de uso de una vía ciclista (a menos que la ley local de tráfico diga otra cosa), indica explícitamente que la vía ciclista no es de uso obligatorio.", // Although as of May 2019 this sign does not legally require the use of a cycleway (unless municipal traffic law states otherwise), it explicitly indicates that the bicycle path is not mandatory.
//                            images: ["S35"],
//                            wrongAnswers: [
//                                "Zona escolar", // School zone
//                                "Área de servicio", // Service area
//                                "Fin de autopista", // End of motorway
//                                "Gasolinera", // Petrol station
//                                "Carretera de montaña", // Mountain road
//                                "Paso a nivel", // Level crossing
//                                "Parking", // Parking area
//                                "Túnel" // Tunnel
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Indicaciones Generales"
//                        ),
//                        TrafficSign(
//                            title: "Fin de vía ciclista no obligatoria", // End of non-mandatory bicycleway
//                            description: "Indica el lugar donde finaliza una vía ciclista que no era de uso obligatorio para los ciclistas.", // Indicates where a non-mandatory bicycleway ends
//                            images: ["S36"],
//                            wrongAnswers: [
//                                "Fin de autopista", // End of motorway
//                                "Fin de autovía", // End of expressway
//                                "Fin de zona peatonal", // End of pedestrian zone
//                                "Fin de área residencial", // End of residential area
//                                "Fin de vía reservada para autobuses", // End of bus lane
//                                "Fin de calzada de sentido único", // End of one-way road
//                                "Fin de zona de estacionamiento limitado", // End of limited parking zone
//                                "Fin de túnel" // End of tunnel
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Indicaciones Generales"
//                        ),
//                        // Subcategory: Señales de Indicaciones Generales
//                        TrafficSign(
//                            title: "Vía reservada para vehículos de movilidad personal", // Road reserved for personal mobility vehicles
//                            description: "Indica una vía reservada exclusivamente para vehículos de movilidad personal (como patinetes eléctricos o segways). Prohíbe el acceso a otros tipos de vehículos y peatones.", // Indicates a lane or road reserved exclusively for personal mobility vehicles such as electric scooters or segways. Other vehicles and pedestrians are not allowed.
//                            images: ["S37"],
//                            wrongAnswers: [
//                                "Vía reservada para autobuses", // Road reserved for buses
//                                "Vía reservada para taxis", // Road reserved for taxis
//                                "Vía reservada para bicicletas", // Road reserved for bicycles
//                                "Fin de autopista", // End of motorway
//                                "Zona de carga y descarga", // Loading and unloading zone
//                                "Área de descanso", // Rest area
//                                "Carril reversible", // Reversible lane
//                                "Fin de zona peatonal" // End of pedestrian zone
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Indicaciones Generales"
//                        ),
//                        TrafficSign(
//                            title: "Vía reservada para ciclos y vehículos de movilidad personal", // Road reserved for cycles and personal mobility vehicles
//                            description: "Indica una vía reservada exclusivamente para ciclos y vehículos de movilidad personal (como bicicletas y patinetes eléctricos). Prohíbe la circulación de otros vehículos y peatones.", // Indicates a lane or road reserved exclusively for bicycles and personal mobility vehicles such as electric scooters. Other vehicles and pedestrians are not allowed.
//                            images: ["S38"],
//                            wrongAnswers: [
//                                "Vía reservada para autobuses", // Road reserved for buses
//                                "Vía reservada para peatones", // Road reserved for pedestrians
//                                "Vía reservada para motocicletas", // Road reserved for motorcycles
//                                "Zona de carga y descarga", // Loading and unloading zone
//                                "Carril reversible", // Reversible lane
//                                "Área de descanso", // Rest area
//                                "Fin de autopista", // End of motorway
//                                "Parking público" // Public parking
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Indicaciones Generales"
//                        ),
//                        TrafficSign(
//                            title: "Fin de vía reservada para vehículos de movilidad personal", // End of road reserved for personal mobility vehicles
//                            description: "Señala el punto donde termina la vía reservada exclusivamente para vehículos de movilidad personal, como patinetes eléctricos. A partir de este punto, vuelve a aplicarse la normativa general de circulación.", // Indicates the point where the lane or road reserved exclusively for personal mobility vehicles (such as electric scooters) ends. From this point on, general traffic rules apply.
//                            images: ["S39"],
//                            wrongAnswers: [
//                                "Fin de vía reservada para ciclos y vehículos de movilidad personal", // End of road reserved for cycles and personal mobility vehicles
//                                "Fin de vía reservada para autobuses", // End of road reserved for buses
//                                "Fin de zona peatonal", // End of pedestrian zone
//                                "Fin de carril reversible", // End of reversible lane
//                                "Fin de autopista", // End of motorway
//                                "Fin de autovía", // End of expressway
//                                "Fin de área de descanso", // End of rest area
//                                "Fin de carril bici" // End of bike lane
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Indicaciones Generales"
//                        ),
//                        TrafficSign(
//                            title: "Fin de vía reservada para ciclos y vehículos de movilidad personal", // End of road reserved for cycles and personal mobility vehicles
//                            description: "Indica el punto donde finaliza la vía reservada exclusivamente para ciclos y vehículos de movilidad personal, como bicicletas y patinetes eléctricos. A partir de este punto, se aplica la normativa general de circulación.", // Indicates the point where the lane or road reserved exclusively for cycles and personal mobility vehicles (such as bicycles and electric scooters) ends. From this point on, general traffic regulations apply.
//                            images: ["S40"],
//                            wrongAnswers: [
//                                "Fin de vía reservada para vehículos de movilidad personal", // End of road reserved for personal mobility vehicles
//                                "Fin de senda ciclable", // End of cycle path
//                                "Fin de zona peatonal", // End of pedestrian zone
//                                "Fin de carril bus", // End of bus lane
//                                "Fin de autopista", // End of motorway
//                                "Fin de autovía", // End of expressway
//                                "Fin de carril VAO", // End of high-occupancy vehicle lane
//                                "Fin de área de descanso" // End of rest area
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Indicaciones Generales"
//                        ),
//                        TrafficSign(
//                            title: "Vía reservada para ciclos y peatones con espacio diferenciado", // Road reserved for cycles and pedestrians with separate lanes
//                            description: "Indica una vía reservada para la circulación de ciclos y peatones, en la que existe un espacio diferenciado para cada tipo de usuario, garantizando la seguridad y la convivencia entre ambos.", // Indicates a road reserved for cycles and pedestrians, with distinct lanes or areas for each, ensuring safety and coexistence between users.
//                            images: ["S41"],
//                            wrongAnswers: [
//                                "Vía reservada para peatones y vehículos de movilidad personal", // Road reserved for pedestrians and personal mobility vehicles
//                                "Vía reservada para ciclos y vehículos de movilidad personal", // Road reserved for cycles and personal mobility vehicles
//                                "Zona peatonal", // Pedestrian zone
//                                "Senda ciclable", // Cycle path
//                                "Camino escolar", // School route
//                                "Carril bus", // Bus lane
//                                "Área residencial", // Residential area
//                                "Vía compartida sin separación" // Shared road without separation
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Indicaciones Generales"
//                        ),
//                        TrafficSign(
//                            title: "Fin de vía reservada para ciclos y peatones con espacio diferenciado", // End of road reserved for cycles and pedestrians with separate lanes
//                            description: "Indica el punto donde finaliza la vía reservada para la circulación de ciclos y peatones con espacios diferenciados. A partir de este punto, ambos usuarios deben incorporarse al tráfico general según corresponda.", // Indicates the point where the reserved road for cycles and pedestrians with separate lanes ends. Beyond this point, both users must merge into general traffic as appropriate.
//                            images: ["S42"],
//                            wrongAnswers: [
//                                "Fin de vía reservada para peatones y vehículos de movilidad personal", // End of road reserved for pedestrians and personal mobility vehicles
//                                "Fin de senda ciclable", // End of cycle path
//                                "Fin de carril bus", // End of bus lane
//                                "Fin de área residencial", // End of residential area
//                                "Fin de camino escolar", // End of school route
//                                "Fin de vía compartida", // End of shared road
//                                "Fin de autopista", // End of motorway
//                                "Fin de autovía" // End of expressway
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Indicaciones Generales"
//                        ),
//                        TrafficSign(
//                            title: "Vía reservada para ciclos, VMP y peatones con espacio diferenciado", // Road reserved for cycles, personal mobility vehicles, and pedestrians with separate lanes
//                            description: "Indica una vía reservada para la circulación de ciclos, vehículos de movilidad personal y peatones, con espacios de circulación diferenciados entre los dos primeros y el tercero. Facilita la convivencia segura entre ciclistas, usuarios de VMP y peatones.", // Indicates a road reserved for cycles, personal mobility vehicles, and pedestrians, with separate circulation areas for the first two and the third. Ensures safe coexistence among all users.
//                            images: ["S43"],
//                            wrongAnswers: [
//                                "Vía reservada para peatones y ciclos", // Road reserved for pedestrians and cycles
//                                "Vía reservada para peatones y VMP", // Road reserved for pedestrians and personal mobility vehicles
//                                "Senda ciclable", // Cycle path
//                                "Zona peatonal", // Pedestrian zone
//                                "Camino escolar", // School route
//                                "Área de descanso", // Rest area
//                                "Carretera convencional", // Conventional road
//                                "Autovía" // Expressway
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Indicaciones Generales"
//                        ),
//                        TrafficSign(
//                            title: "Fin de vía reservada para ciclos, VMP y peatones con espacio diferenciado", // End of road reserved for cycles, personal mobility vehicles, and pedestrians with separate lanes
//                            description: "Indica el lugar donde finaliza la vía reservada para la circulación de ciclos, vehículos de movilidad personal y peatones con espacios de circulación diferenciados entre los dos primeros y el tercero.", // Indicates the point where the road reserved for cycles, personal mobility vehicles, and pedestrians with separate lanes ends.
//                            images: ["S44"],
//                            wrongAnswers: [
//                                "Fin de autopista", // End of motorway
//                                "Fin de autovía", // End of expressway
//                                "Fin de zona urbana", // End of urban zone
//                                "Fin de estacionamiento", // End of parking zone
//                                "Fin de área de servicio", // End of service area
//                                "Fin de velocidad aconsejable", // End of advisory speed
//                                "Fin de prohibición de adelantamiento", // End of overtaking ban
//                                "Fin de carretera de montaña" // End of mountain road
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Indicaciones Generales"
//                        ),
//                        TrafficSign(
//                            title: "Situación de un paso para ciclistas", // Location of a bicycle crossing
//                            description: "Indica la situación de un paso habilitado para ciclistas. Señal conforme al proyecto de Real Decreto por el que se modifica el Reglamento General de Circulación, aprobado por Real Decreto 1428/2003, de 21 de noviembre, en materia de señalización de tráfico.", // Indicates the location of a designated bicycle crossing, as defined by the Royal Decree regulating Spanish traffic signage.
//                            images: ["S45"],
//                            wrongAnswers: [
//                                "Zona peatonal", // Pedestrian zone
//                                "Área de servicio", // Service area
//                                "Carretera de doble sentido", // Two-way road
//                                "Fin de autopista", // End of motorway
//                                "Aparcamiento", // Parking
//                                "Intersección con prioridad", // Priority intersection
//                                "Gasolinera", // Petrol station
//                                "Carril bus" // Bus lane
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Indicaciones Generales"
//                        ),
//                        TrafficSign(
//                            title: "Situación de un paso para peatones y ciclistas",
//                            description: "Indica la situación de un paso habilitado para peatones y ciclistas. Señal conforme al proyecto de Real Decreto por el que se modifica el Reglamento General de Circulación, aprobado por Real Decreto 1428/2003, de 21 de noviembre, en materia de señalización de tráfico.", // Indicates the location of a designated crossing for both pedestrians and cyclists, as defined by the Royal Decree regulating Spanish traffic signage.
//                            images: ["S46"],
//                            wrongAnswers: [
//                                "Zona residencial", // Residential area
//                                "Zona peatonal", // Pedestrian zone
//                                "Área de servicio", // Service area
//                                "Carretera de doble sentido", // Two-way road
//                                "Fin de autopista", // End of motorway
//                                "Aparcamiento", // Parking
//                                "Gasolinera", // Petrol station
//                                "Carril bus" // Bus lane
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Indicaciones Generales"
//                        ),
//                        TrafficSign(
//                            title: "Zona de coexistencia de usuarios", // Shared zone for all users
//                            description: "Indica una zona de coexistencia donde peatones, ciclistas y vehículos comparten el espacio vial. Los vehículos deben circular a velocidad reducida y ceder la prioridad a peatones y ciclistas.", // Indicates a shared space where pedestrians, cyclists, and vehicles coexist. Drivers must reduce speed and give priority to pedestrians and cyclists.
//                            images: ["S47"],
//                            wrongAnswers: [
//                                "Zona residencial", // Residential area
//                                "Zona peatonal", // Pedestrian zone
//                                "Carril bici", // Bicycle lane
//                                "Carretera convencional", // Conventional road
//                                "Área de descanso", // Rest area
//                                "Aparcamiento", // Parking
//                                "Gasolinera", // Petrol station
//                                "Fin de autopista" // End of motorway
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Indicaciones Generales"
//                        ),
//                        TrafficSign(
//                            title: "Avanza moto o bici", // Advance motorcycles or bicycles
//                            description: "Indica una zona adelantada de espera para motocicletas o bicicletas en un cruce regulado por semáforo. Permite que estos vehículos se sitúen delante del resto del tráfico para mejorar la visibilidad y la seguridad al arrancar.", // Indicates an advanced waiting area for motorcycles or bicycles at a signal-controlled intersection, allowing them to position ahead of other traffic for better visibility and safety when starting.
//                            images: ["S49"],
//                            wrongAnswers: [
//                                "Zona de coexistencia", // Shared user zone
//                                "Carril bus-taxi", // Bus-taxi lane
//                                "Carril bici", // Bicycle lane
//                                "Zona de carga y descarga", // Loading and unloading zone
//                                "Paso de peatones", // Pedestrian crossing
//                                "Área de servicio", // Service area
//                                "Fin de autopista", // End of motorway
//                                "Aparcamiento disuasorio" // Park and ride
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Indicaciones Generales"
//                        ),
//                    ]
//                ),
//                TrafficSubSection(
//                    index: 1,
//                    name: "Señales de Carriles",
//                    description: "Informan sobre el uso, destino o condiciones de los distintos carriles de una vía. Pueden indicar giros permitidos, sentidos de circulación o cambios de carril obligatorios.",
//                    signs: [
//                        TrafficSign(
//                            title: "Carriles de tráfico (obligatorio para vehículos rápidos o lentos)",
//                            description: "Indica que el carril sobre el que se sitúa la señal de velocidad mínima solo puede ser utilizado por vehículos que circulen a una velocidad igual o superior a la indicada. Si las condiciones lo permiten, los vehículos deben circular por el carril derecho.", // Indicates that the lane marked with a minimum speed sign may only be used by vehicles traveling at or above that speed. If conditions allow, vehicles should use the right-hand lane.
//                            images: ["S50a", "S50b", "S50c", "S50d", "S50e"],
//                            wrongAnswers: [
//                                "Carril bus", // Bus lane
//                                "Carril VAO", // High-occupancy vehicle lane
//                                "Carril bici", // Bicycle lane
//                                "Carril reversible", // Reversible lane
//                                "Carril de aceleración", // Acceleration lane
//                                "Carril de deceleración", // Deceleration lane
//                                "Carril de emergencia", // Emergency lane
//                                "Carril de sentido contrario" // Opposite-direction lane
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Carriles"
//                        ),
//                        TrafficSign(
//                            title: "Carril reservado para autobuses",
//                            description: "Indica la prohibición para los conductores de vehículos distintos del transporte colectivo de circular por el carril indicado. La inscripción 'TAXI' autoriza también a los taxis a utilizarlo. En los tramos donde la línea longitudinal exterior sea discontinua, su uso general se permite únicamente para realizar alguna maniobra distinta de la parada, el estacionamiento, el cambio de sentido o el adelantamiento, cediendo siempre el paso a los autobuses y, en su caso, a los taxis.", // Indicates that only public transport vehicles (and taxis if shown) may use the lane. If the white line is dashed, other vehicles may use it briefly to maneuver, but must always yield to buses and taxis.
//                            images: ["S51"],
//                            wrongAnswers: [
//                                "Carril VAO", // High-occupancy vehicle lane
//                                "Carril bici", // Bicycle lane
//                                "Carril reversible", // Reversible lane
//                                "Carril de emergencia", // Emergency lane
//                                "Carril de aceleración", // Acceleration lane
//                                "Carril de deceleración", // Deceleration lane
//                                "Carril de vehículos lentos", // Slow vehicle lane
//                                "Carril central" // Center lane
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Carriles"
//                        ),
//                        TrafficSign(
//                            title: "Fin de carril de circulación",
//                            description: "Advierte de la próxima finalización de un carril de circulación, indicando el punto en el que deja de estar disponible y la necesidad de cambiar de carril con antelación para mantener la fluidez del tráfico.", // Warns of the upcoming end of a traffic lane, showing where it ceases to be available and advising drivers to merge early to maintain traffic flow.
//                            images: ["S52", "S52a", "S52b", "S52c", "S52e", "S52f", "S52g"],
//                            wrongAnswers: [
//                                "Carril de incorporación", // Merging lane
//                                "Carril reversible", // Reversible lane
//                                "Carril VAO", // High-occupancy vehicle lane
//                                "Carril reservado para autobuses", // Bus lane
//                                "Carril bici", // Bicycle lane
//                                "Carril de vehículos lentos", // Slow vehicle lane
//                                "Carril central", // Center lane
//                                "Carril de emergencia" // Emergency lane
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Carriles"
//                        ),
//                        TrafficSign(
//                            title: "Inicio de carril adicional",
//                            description: "Indica, en una calzada con un solo carril en un sentido, que en el siguiente tramo habrá dos carriles en el mismo sentido de circulación.", // Indicates that on a road section with a single lane in one direction, the next section will have two lanes in the same direction
//                            images: ["S53"],
//                            wrongAnswers: [
//                                "Fin de carril de circulación", // End of traffic lane
//                                "Carril reservado para autobuses", // Bus lane
//                                "Carril reversible", // Reversible lane
//                                "Zona de adelantamiento prohibido", // No overtaking zone
//                                "Carril para vehículos lentos", // Slow vehicle lane
//                                "Salida próxima", // Upcoming exit
//                                "Cambio de sentido" // U-turn
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Carriles"
//                        ),
//                        TrafficSign(
//                            title: "Paso de uno a dos carriles con límite de velocidad", // Transition from one to two lanes with speed limits
//                            description: "Indica el paso de un solo carril a dos carriles de circulación en el mismo sentido, señalando el límite de velocidad máximo permitido en cada uno de ellos.", // Indicates the transition from one to two lanes in the same direction, specifying the maximum speed allowed in each
//                            images: ["S53a"],
//                            wrongAnswers: [
//                                "Inicio de carril adicional", // Start of additional lane
//                                "Inicio de tercer carril", // Start of third lane
//                                "Paso de dos a tres carriles con límite de velocidad", // Transition from two to three lanes with speed limits
//                                "Carril reversible", // Reversible lane
//                                "Carril reservado para autobuses", // Bus lane
//                                "Carril para vehículos lentos", // Slow vehicle lane
//                                "Fin de carril de circulación" // End of traffic lane
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Carriles"
//                        ),
//                        TrafficSign(
//                            title: "Inicio de tercer carril", // Start of third traffic lane
//                            description: "Indica, en una calzada con dos carriles en un sentido, que en el siguiente tramo habrá tres carriles en el mismo sentido de circulación.", // Indicates that on a road section with two lanes in one direction, the next section will have three lanes in the same direction
//                            images: ["S53b"],
//                            wrongAnswers: [
//                                "Fin de carril de circulación", // End of traffic lane
//                                "Carril reservado para autobuses", // Bus lane
//                                "Carril reversible", // Reversible lane
//                                "Zona de adelantamiento prohibido", // No overtaking zone
//                                "Carril para vehículos lentos", // Slow vehicle lane
//                                "Salida próxima", // Upcoming exit
//                                "Cambio de sentido" // U-turn
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Carriles"
//                        ),
//                        TrafficSign(
//                            title: "Paso de dos a tres carriles con límite de velocidad", // Transition from two to three lanes with speed limits
//                            description: "Indica el paso de dos a tres carriles de circulación, especificando el límite de velocidad máximo permitido en cada uno de ellos.", // Indicates the transition from two to three lanes, specifying the maximum speed allowed in each
//                            images: ["S53c"],
//                            wrongAnswers: [
//                                "Fin de carril de circulación", // End of traffic lane
//                                "Carril reservado para autobuses", // Bus lane
//                                "Carril reversible", // Reversible lane
//                                "Zona de adelantamiento prohibido", // No overtaking zone
//                                "Salida próxima" // Upcoming exit
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Carriles"
//                        ),
//                        TrafficSign(
//                            title: "Bifurcación de carriles", // Lane fork
//                            description: "Indica bifurcaciones en calzadas con varios carriles. Puede señalar una bifurcación hacia la izquierda, hacia la derecha o el paso de dos carriles a uno solo en direcciones distintas.", // Indicates lane forks on multi-lane roads, showing left, right, or two-lane split directions
//                            images: ["S60a", "S60b"],
//                            wrongAnswers: [
//                                "Fin de carril de circulación", // End of traffic lane
//                                "Inicio de carril adicional", // Start of additional lane
//                                "Carril reversible", // Reversible lane
//                                "Carril reservado para autobuses", // Bus lane
//                                "Salida próxima", // Upcoming exit
//                                "Incorporación desde la derecha", // Merge from the right
//                                "Cambio de sentido al mismo nivel", // At-grade U-turn
//                                "Zona de adelantamiento prohibido" // No overtaking zone
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Carriles"
//                        ),
//                        TrafficSign(
//                            title: "Bifurcación en calzada de tres carriles", // Lane fork on three-lane road
//                            description: "Indica que uno de los carriles de una calzada con tres carriles en el mismo sentido se bifurca hacia la izquierda o hacia la derecha, según el diseño de la señal.", // Indicates that one of the lanes on a three-lane road forks left or right depending on the sign.
//                            images: ["S61a", "S61b", "S61bb", "S61c", "S61d"],
//                            wrongAnswers: [
//                                "Bifurcación en calzada de dos carriles",
//                                "Fin de carril de circulación",
//                                "Inicio de carril adicional",
//                                "Carril reservado para autobuses",
//                                "Incorporación desde la derecha",
//                                "Cambio de sentido al mismo nivel",
//                                "Salida próxima",
//                                "Zona de adelantamiento prohibido"
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Carriles"
//                        ),
//                        TrafficSign(
//                            title: "Divergencia del carril derecho en calzada bidireccional", // Divergence of right lane on two-way road
//                            description: "Indica que el carril derecho de una calzada bidireccional se separa del principal para continuar en otra dirección. Advierte a los conductores de la próxima divergencia del tráfico.", // Indicates that the right lane diverges from the main road to continue in another direction.
//                            images: ["S61c2022"],
//                            wrongAnswers: [
//                                "Bifurcación en calzada de tres carriles",
//                                "Bifurcación en calzada de dos carriles",
//                                "Fin de carril de circulación",
//                                "Inicio de carril adicional",
//                                "Carril reservado para autobuses",
//                                "Incorporación desde la izquierda",
//                                "Cambio de sentido al mismo nivel",
//                                "Carril reversible"
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Carriles"
//                        ),
//                        TrafficSign(
//                            title: "Bifurcación en calzada de cuatro carriles", // Fork on four-lane road
//                            description: "Indica que en una calzada con cuatro carriles en el mismo sentido, el carril izquierdo o el derecho se bifurcará hacia el mismo lado en el siguiente tramo.", // Indicates that on a four-lane road, the left or right lane will fork towards that same side.
//                            images: ["S62a", "S62b"],
//                            wrongAnswers: [
//                                "Cambio de sentido al mismo nivel",
//                                "Gasolinera",
//                                "Área de descanso",
//                                "Carretera con prioridad",
//                                "Zona urbana",
//                                "Fin de autopista",
//                                "Entrada de túnel",
//                                "Intersección con prioridad"
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Carriles"
//                        ),
//                        TrafficSign(
//                            title: "Preseñalización de carriles en bifurcación", // Lane pre-selection at fork
//                            description: "Indica con antelación la disposición y el destino de los carriles en una bifurcación de calzadas con varios carriles, ayudando a los conductores a elegir el adecuado antes de la separación.", // Indicates in advance the layout and destination of lanes at a multi-lane fork.
//                            images: ["S63", "S63b", "S63c", "S63d"],
//                            wrongAnswers: [
//                                "Cambio de sentido al mismo nivel",
//                                "Fin de autopista",
//                                "Gasolinera",
//                                "Zona urbana",
//                                "Área de servicio",
//                                "Carretera convencional",
//                                "Cruce de ferrocarril sin barreras",
//                                "Paso subterráneo para peatones"
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Carriles"
//                        ),
//                        TrafficSign(
//                            title: "Calzada con carril bici", // Road with cycle lane
//                            description: "Indica la existencia de un carril bici en la calzada. Advierte a los conductores de vehículos a motor sobre la presencia de ciclistas y la necesidad de extremar la precaución.", // Indicates the existence of a bicycle lane on the road.
//                            images: ["S64a", "S64b"],
//                            wrongAnswers: [
//                                "Senda ciclable",
//                                "Vía reservada para peatones",
//                                "Carril bus",
//                                "Zona urbana",
//                                "Área de servicio",
//                                "Gasolinera",
//                                "Carretera con prioridad",
//                                "Paso para ciclistas"
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Carriles"
//                        ),
//                        TrafficSign(
//                            title: "Vía reservada para ciclos adosada a calzada de un único sentido", // Road reserved for cycles adjacent to a one-way
//                            description: "Indica la existencia de una vía reservada para ciclos adosada a una calzada de un único sentido de circulación. Advierte a los conductores de la presencia de ciclistas y de la obligación de respetar su espacio reservado.", // Indicates the presence of a cycle lane adjacent to a one-way road, warning drivers about cyclists and the obligation to respect their space.
//                            images: ["S65a", "S65b"],
//                            wrongAnswers: [
//                                "Zona de coexistencia de usuarios", // Shared zone for all users
//                                "Área de descanso", // Rest area
//                                "Fin de autopista", // End of motorway
//                                "Zona residencial", // Residential area
//                                "Peaje electrónico", // Electronic toll
//                                "Cambio de sentido al mismo nivel", // Same-level U-turn
//                                "Carretera convencional", // Conventional road
//                                "Parking público" // Public parking
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Carriles"
//                        ),
//                        TrafficSign(
//                            title: "Carril bici en sentido opuesto", // Cycle lane in opposite direction
//                            description: "Indica la existencia de un carril bici en sentido opuesto al de la circulación general de vehículos. Advierte a los conductores de la presencia de ciclistas que circulan en dirección contraria y la necesidad de extremar la precaución.", // Indicates the existence of a bicycle lane running opposite to the general traffic flow, warning drivers to be cautious of oncoming cyclists.
//                            images: ["S66"],
//                            wrongAnswers: [
//                                "Zona de coexistencia de usuarios", // Shared zone for all users
//                                "Carril bus", // Bus lane
//                                "Área de descanso", // Rest area
//                                "Zona residencial", // Residential area
//                                "Peaje electrónico", // Electronic toll
//                                "Carretera convencional" // Conventional road
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Carriles"
//                        ),
//                        TrafficSign(
//                            title: "Tramo de calzada con un carril para el sentido propio y dos para el opuesto", // Road section with one lane in own direction and two in opposite
//                            description: "Indica un tramo de calzada con un solo carril en el sentido propio de circulación y dos carriles en el sentido opuesto. Advierte a los conductores de la necesidad de extremar la precaución por la posible presencia de vehículos que realizan adelantamientos en sentido contrario.", // Indicates a road section with one lane in the current direction and two in the opposite, warning drivers to be cautious of oncoming overtaking vehicles.
//                            images: ["S68"],
//                            wrongAnswers: [
//                                "Tramo de calzada con dos carriles en ambos sentidos", // Road section with two lanes in both directions
//                                "Inicio de carril adicional", // Start of additional lane
//                                "Fin de carril de circulación", // End of traffic lane
//                                "Carril reversible", // Reversible lane
//                                "Cambio de sentido al mismo nivel", // At-grade U-turn
//                                "Carretera convencional", // Conventional road
//                                "Zona urbana", // Urban area
//                                "Área de descanso" // Rest area
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Carriles"
//                        ),
//                        TrafficSign(
//                            title: "Confluencia de carriles en calzada de un único carril", // Merge of lanes into a one-lane carriageway
//                            description: "Indica la confluencia de un carril por la izquierda o por la derecha en una calzada de un único carril. Advierte a los conductores de la incorporación de tráfico desde un lateral y la necesidad de facilitar la maniobra de entrada de los vehículos que se incorporan.", // Indicates the merging of a lane from the left or right into a one-lane road, warning drivers to allow merging vehicles to enter safely.
//                            images: ["S70a", "S70b"],
//                            wrongAnswers: [
//                                "Inicio de carril adicional", // Start of additional lane
//                                "Carril reversible", // Reversible lane
//                                "Cambio de sentido al mismo nivel", // At-grade U-turn
//                                "Carril bus", // Bus lane
//                                "Carril VAO", // High-occupancy vehicle lane
//                                "Zona de adelantamiento prohibido", // No overtaking zone
//                                "Cruce de calzadas" // Road intersection
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Carriles"
//                        ),
//                        TrafficSign(
//                            title: "Confluencia de un carril en calzada de dos carriles", // Merge of a lane into a two-lane carriageway
//                            description: "Indica la confluencia de un carril por la izquierda o por la derecha en una calzada de dos carriles en el mismo sentido de circulación. Advierte a los conductores de la incorporación de tráfico lateral y de la necesidad de facilitar la maniobra de entrada.", // Indicates the merging of a lane from the left or right into a two-lane road, warning drivers about lateral traffic joining and the need to allow entry.
//                            images: ["S71a", "S71b"],
//                            wrongAnswers: [
//                                "Fin de carril de circulación", // End of traffic lane
//                                "Inicio de carril adicional", // Start of additional lane
//                                "Carril reversible", // Reversible lane
//                                "Carril bus", // Bus lane
//                                "Carril VAO", // High-occupancy vehicle lane
//                                "Zona de adelantamiento prohibido", // No overtaking zone
//                                "Cambio de sentido al mismo nivel", // At-grade U-turn
//                                "Cruce de calzadas" // Road intersection
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Carriles"
//                        ),
//                        TrafficSign(
//                            title: "Confluencia de un carril en calzada de tres carriles", // Merge of a lane into a three-lane carriageway
//                            description: "Indica la confluencia de un carril por la izquierda o por la derecha en una calzada de tres carriles en el mismo sentido de circulación. Advierte a los conductores de la incorporación de tráfico lateral y de la necesidad de facilitar la maniobra de entrada.", // Indicates the merging of a lane from the left or right into a three-lane road, warning drivers about merging traffic and the need to facilitate entry.
//                            images: ["S72a", "S72b"],
//                            wrongAnswers: [
//                                "Fin de carril de circulación", // End of traffic lane
//                                "Inicio de carril adicional", // Start of additional lane
//                                "Carril reversible", // Reversible lane
//                                "Carril bus", // Bus lane
//                                "Carril VAO", // High-occupancy vehicle lane
//                                "Zona de adelantamiento prohibido", // No overtaking zone
//                                "Cambio de sentido al mismo nivel", // At-grade U-turn
//                                "Cruce de calzadas" // Road intersection
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Carriles"
//                        ),
//                        TrafficSign(
//                            title: "Confluencia de dos carriles en calzada de dos carriles", // Merge of two lanes into a two-lane carriageway
//                            description: "Indica la confluencia de dos carriles por la izquierda o por la derecha en una calzada de dos carriles en el mismo sentido de circulación. Advierte a los conductores de la incorporación simultánea de tráfico lateral y la necesidad de extremar la precaución durante la maniobra.", // Indicates the merging of two lanes from the left or right into a two-lane carriageway, warning drivers about simultaneous merging traffic and the need for extra caution.
//                            images: ["S73a", "S73b"],
//                            wrongAnswers: [
//                                "Fin de carril de circulación", // End of traffic lane
//                                "Inicio de carril adicional", // Start of additional lane
//                                "Carril reversible", // Reversible lane
//                                "Carril bus", // Bus lane
//                                "Carril VAO", // High-occupancy vehicle lane
//                                "Zona de adelantamiento prohibido", // No overtaking zone
//                                "Cambio de sentido al mismo nivel", // At-grade U-turn
//                                "Cruce de calzadas" // Road intersection
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Carriles"
//                        ),
//                    ]
//                ),
//                TrafficSubSection(
//                    index: 2,
//                    name: "Señales de Servicio",
//                    description: "Indican la proximidad de servicios disponibles para los conductores, como gasolineras, talleres, hospitales o áreas de descanso. Se representan con símbolos fácilmente reconocibles.",
//                    signs: [
//                        TrafficSign(
//                            title: "Puesto de socorro",
//                            description: "Indica la ubicación de un centro oficialmente reconocido donde puede prestarse asistencia médica de urgencia en caso de accidente.", // Indicates the location of an officially recognized center where emergency medical assistance can be provided in case of an accident.
//                            images: ["S100"],
//                            wrongAnswers: [
//                                "Ambulancia permanente", // Permanent ambulance service
//                                "Teléfono de emergencia", // Emergency phone
//                                "Área de descanso", // Rest area
//                                "Estación de servicio", // Service station
//                                "Zona de acampada", // Camping area
//                                "Hotel o motel", // Hotel or motel
//                                "Información turística", // Tourist information
//                                "Parque nacional" // National park
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Servicio"
//                        ),
//                        TrafficSign(
//                            title: "Servicio de ambulancia", // Ambulance service
//                            description: "Indica la ubicación de un servicio de ambulancia permanente destinado a atender y trasladar a las personas heridas en accidentes de tráfico.", // Indicates the location of a permanent ambulance service for attending and transferring injured people from traffic accidents.
//                            images: ["S101"],
//                            wrongAnswers: [
//                                "Puesto de socorro", // Aid station
//                                "Teléfono de emergencia", // Emergency phone
//                                "Taller mecánico", // Repair shop
//                                "Área de servicio", // Service area
//                                "Cafetería", // Coffee shop
//                                "Zona de pesca", // Fishing area
//                                "Restaurante", // Restaurant
//                                "Parking ferroviario" // Railway parking
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Servicio"
//                        ),
//                        TrafficSign(
//                            title: "Servicio de inspección técnica de vehículos",
//                            description: "Indica la situación de una estación de inspección técnica de vehículos.", // Sign S-102 indicates the location of a vehicle technical inspection station (ITV).
//                            images: ["S102"],
//                            wrongAnswers: [
//                                "Área de descanso", // Rest area
//                                "Cafetería", // Coffee shop
//                                "Hotel o motel", // Hotel or motel
//                                "Teléfono de emergencia", // Emergency phone
//                                "Área de servicio", // Service area
//                                "Puesto de socorro" // Aid station
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Servicio"
//                        ),
//                        TrafficSign(
//                            title: "Taller de reparación", // Repair shop
//                            description: "Indica la situación de un taller de reparación de automóviles.", // Sign S-103 indicates the location of a vehicle repair shop.
//                            images: ["S103"],
//                            wrongAnswers: [
//                                "Estación de servicio", // Fuel station
//                                "Área de descanso", // Rest area
//                                "Cafetería", // Coffee shop
//                                "Hotel o motel", // Hotel or motel
//                                "Zona de acampada", // Camping area
//                                "Parque nacional", // National park
//                                "Información turística", // Tourist information
//                                "Puesto de socorro" // Aid station
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Servicio"
//                        ),
//                        TrafficSign(
//                            title: "Teléfono de emergencia", // Emergency phone
//                            description: "Indica la situación de un aparato telefónico. En caso de incluir la inscripción “S.O.S”, indica la situación de un teléfono de uso permanente para advertir a las autoridades de la existencia de un accidente o emergencia en la vía.",
//                            images: ["S104", "S104b"],
//                            wrongAnswers: [
//                                "Ambulancia permanente", // Ambulance service
//                                "Estación de servicio", // Service station
//                                "Área de descanso", // Rest area
//                                "Hotel o motel", // Hotel or motel
//                                "Restaurante", // Restaurant
//                                "Área de servicio", // Service area
//                                "Zona de pesca", // Fishing preserve
//                                "Taller mecánico" // Repair shop
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Servicio"
//                        ),
//                        TrafficSign(
//                            title: "Surtidor de carburante", // Fuel station
//                            description: "Indica la situación de un surtidor o estación de servicio de carburante.",
//                            images: ["S105a", "S105b", "S105c", "S105d", "S105e", "S105f"],
//                            wrongAnswers: [
//                                "Taller mecánico", // Repair shop
//                                "Área de descanso", // Rest area
//                                "Hotel o motel", // Hotel or motel
//                                "Cafetería", // Coffee shop
//                                "Teléfono de emergencia", // Emergency phone
//                                "Zona de acampada", // Camping area
//                                "Área de servicio", // Service area
//                                "Información turística" // Tourist information
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Servicio"
//                        ),
//                        TrafficSign(
//                            title: "Taller de reparación y surtidor de carburante", // Repair shop and fuel pump
//                            description: "Indica la situación de una instalación que dispone de taller de reparación y surtidor de carburante.",
//                            images: ["S106"],
//                            wrongAnswers: [
//                                "Puesto de socorro", // Aid station
//                                "Hotel o motel", // Hotel or motel
//                                "Área de descanso", // Rest area
//                                "Restaurante", // Restaurant
//                                "Cafetería", // Coffee shop
//                                "Teléfono de emergencia", // Emergency phone
//                                "Información turística", // Tourist information
//                                "Parque nacional" // National park
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Servicio"
//                        ),
//                        TrafficSign(
//                            title: "Campamento", // Camp area
//                            description: "Indica la situación de un lugar donde está permitida la acampada",
//                            images: ["S107"],
//                            wrongAnswers: [
//                                "Área de picnic", // Picnic area
//                                "Hotel o motel", // Hotel or motel
//                                "Área de descanso", // Rest area
//                                "Taller mecánico", // Repair shop
//                                "Restaurante", // Restaurant
//                                "Teléfono de emergencia", // Emergency phone
//                                "Estación de servicio", // Fuel station
//                                "Información turística" // Tourist information
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Servicio"
//                        ),
//                        TrafficSign(
//                            title: "Agua", // Water
//                            description: "Indica la situación de una fuente con agua.",
//                            images: ["S108"],
//                            wrongAnswers: [
//                                "Zona de acampada", // Camping area
//                                "Restaurante", // Restaurant
//                                "Área de descanso", // Rest area
//                                "Hotel o motel", // Hotel or motel
//                                "Taller mecánico", // Repair shop
//                                "Parque nacional", // National park
//                                "Área de servicio", // Service area
//                                "Área de picnic" // Picnic area
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Servicio"
//                        ),
//                        TrafficSign(
//                            title: "Lugar pintoresco", // Picturesque place
//                            description: "Indica un sitio pintoresco o el lugar desde el que se divisa. Su nombre podrá figurar inscrito en la señal.",
//                            images: ["S109"],
//                            wrongAnswers: [
//                                "Parque nacional", // National park
//                                "Monumento", // Monument
//                                "Área de descanso", // Rest area
//                                "Restaurante", // Restaurant
//                                "Zona de pesca", // Fishing area
//                                "Hotel o motel", // Hotel or motel
//                                "Área de picnic", // Picnic area
//                                "Información turística" // Tourist information
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Servicio"
//                        ),
//                        TrafficSign(
//                            title: "Hotel o motel", // Hotel or motel
//                            description: "Indica la situación de un hotel o mote",
//                            images: ["S110"],
//                            wrongAnswers: [
//                                "Restaurante", // Restaurant
//                                "Cafetería", // Coffee shop
//                                "Área de descanso", // Rest area
//                                "Zona de acampada", // Camping area
//                                "Área de servicio", // Service area
//                                "Parque nacional", // National park
//                                "Taller mecánico", // Repair shop
//                                "Teléfono de emergencia" // Emergency phone
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Servicio"
//                        ),
//                        TrafficSign(
//                            title: "Restaurante", // Catering
//                            description: "Indica la situación de un restaurante.",
//                            images: ["S111"],
//                            wrongAnswers: [
//                                "Cafetería", // Coffee shop
//                                "Hotel o motel", // Hotel or motel
//                                "Área de servicio", // Service area
//                                "Área de descanso", // Rest area
//                                "Teléfono de emergencia", // Emergency phone
//                                "Zona de pesca", // Fishing preserve
//                                "Monumento", // Monument
//                                "Información turística" // Tourist information
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Servicio"
//                        ),
//                        TrafficSign(
//                            title: "Cafetería", // Coffee shop
//                            description: "Indica la situación de un bar o cafetería.",
//                            images: ["S112"],
//                            wrongAnswers: [
//                                "Restaurante", // Restaurant
//                                "Hotel o motel", // Hotel or motel
//                                "Área de servicio", // Service area
//                                "Área de descanso", // Rest area
//                                "Puesto de socorro", // Aid station
//                                "Teléfono de emergencia", // Emergency phone
//                                "Zona de acampada", // Camping area
//                                "Información turística" // Tourist information
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Servicio"
//                        ),
//                        TrafficSign(
//                            title: "Área para autocaravanas", // Field for mobile homes
//                            description: "Indica la situación de un terreno en el que puede acamparse con remolque‐vivienda (caravana).",
//                            images: ["S113"],
//                            wrongAnswers: [
//                                "Área de servicio", // Service area
//                                "Área de descanso", // Rest area
//                                "Hotel o motel", // Hotel or motel
//                                "Cafetería", // Coffee shop
//                                "Parque nacional", // National park
//                                "Restaurante", // Restaurant
//                                "Información turística" // Tourist information
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Servicio"
//                        ),
//                        TrafficSign(
//                            title: "Merendero", // Picnic area
//                            description: "Indica el lugar que puede utilizarse para el consumo de comidas o bebidas.",
//                            images: ["S114"],
//                            wrongAnswers: [
//                                "Restaurante", // Restaurant
//                                "Hotel o motel", // Hotel or motel
//                                "Cafetería", // Coffee shop
//                                "Área de servicio", // Service area
//                                "Puesto de socorro", // Aid station
//                                "Información turística" // Tourist information
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Servicio"
//                        ),
//                        TrafficSign(
//                            title: "Inicio de ruta a pie", // Starting point for walking tours
//                            description: "Indica un lugar apropiado para iniciar excursiones a pie.",
//                            images: ["S115"],
//                            wrongAnswers: [
//                                "Merendero", // Picnic area
//                                "Zona de acampada", // Camping area
//                                "Parque nacional", // National park
//                                "Área de descanso", // Rest area
//                                "Monumento", // Monument
//                                "Restaurante", // Restaurant
//                                "Hotel o motel", // Hotel or motel
//                                "Información turística" // Tourist information
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Servicio"
//                        ),
//                        TrafficSign(
//                            title: "Zona de acampada y autocaravanas", // Camping and mobile home ground
//                            description: "Indica la situación de un lugar donde puede acamparse con tienda de campaña o con remolque‐vivienda.",
//                            images: ["S116"],
//                            wrongAnswers: [
//                                "Área de servicio", // Service area
//                                "Área de descanso", // Rest area
//                                "Hotel o motel", // Hotel or motel
//                                "Cafetería", // Coffee shop
//                                "Puesto de socorro", // Aid station
//                                "Taller mecánico", // Repair shop
//                                "Teléfono de emergencia", // Emergency phone
//                                "Zona de pesca" // Fishing area
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Servicio"
//                        ),
//                        TrafficSign(
//                            title: "Albergue juvenil", // Youth hostel
//                            description: "Indica la situación de un albergue juvenil.",
//                            images: ["S117"],
//                            wrongAnswers: [
//                                "Hotel o motel", // Hotel or motel
//                                "Restaurante", // Restaurant
//                                "Cafetería", // Coffee shop
//                                "Área de descanso", // Rest area
//                                "Parque nacional", // National park
//                                "Zona de acampada", // Camping area
//                                "Área de servicio", // Service area
//                                "Información turística" // Tourist information
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Servicio"
//                        ),
//                        TrafficSign(
//                            title: "Información turística", // Tourist information
//                            description: "Indica la situación de una oficina de información turística.",
//                            images: ["S118"],
//                            wrongAnswers: [
//                                "Monumento", // Monument
//                                "Parque nacional", // National park
//                                "Lugar pintoresco", // Picturesque place
//                                "Restaurante", // Restaurant
//                                "Hotel o motel", // Hotel or motel
//                                "Área de descanso", // Rest area
//                                "Zona de pesca", // Fishing preserve
//                                "Área de servicio" // Service area
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Servicio"
//                        ),
//                        TrafficSign(
//                            title: "Coto de pesca", // Fishing preserve
//                            description: "Indica un lago o tramo de río en el que la pesca está sujeta a autorización especial.",
//                            images: ["S119"],
//                            wrongAnswers: [
//                                "Parque nacional", // National park
//                                "Lugar pintoresco", // Picturesque place
//                                "Área de descanso", // Rest area
//                                "Zona de acampada", // Camping area
//                                "Restaurante", // Restaurant
//                                "Área de servicio", // Service area
//                                "Monumento", // Monument
//                                "Información turística" // Tourist information
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Servicio"
//                        ),
//                        TrafficSign(
//                            title: "Parque nacional", // National park
//                            description: "Indica la situación de un parque o espacio natural. Su nombre podrá figurar inscrito en la señal.",
//                            images: ["S120"],
//                            wrongAnswers: [
//                                "Lugar pintoresco", // Picturesque place
//                                "Coto de pesca", // Fishing preserve
//                                "Área de descanso", // Rest area
//                                "Área de picnic", // Picnic area
//                                "Monumento", // Monument
//                                "Hotel o motel", // Hotel or motel
//                                "Restaurante", // Restaurant
//                                "Información turística" // Tourist information
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Servicio"
//                        ),
//                        TrafficSign(
//                            title: "Monumento", // Monument
//                            description: "Indica la situación de una obra histórica o artística declarada monumento.",
//                            images: ["S121"],
//                            wrongAnswers: [
//                                "Lugar pintoresco", // Picturesque place
//                                "Parque nacional", // National park
//                                "Coto de pesca", // Fishing preserve
//                                "Restaurante", // Restaurant
//                                "Hotel o motel", // Hotel or motel
//                                "Área de descanso", // Rest area
//                                "Área de servicio", // Service area
//                                "Información turística" // Tourist information
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Servicio"
//                        ),
//                        TrafficSign(
//                            title: "Otros servicios", // Other services
//                            description: "Señal genérica para cualquier otro servicio, que se inscribirá en el recuadro blanco.",
//                            images: ["S122"],
//                            wrongAnswers: [
//                                "Estación de servicio", // Fuel station
//                                "Área de descanso", // Rest area
//                                "Restaurante", // Restaurant
//                                "Hotel o motel", // Hotel or motel
//                                "Cafetería", // Coffee shop
//                                "Teléfono de emergencia", // Emergency phone
//                                "Puesto de socorro", // Aid station
//                                "Parque nacional" // National park
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Servicio"
//                        ),
//                        TrafficSign(
//                            title: "Área de descanso", // Rest area
//                            description: "Indica la situación de un área de descanso.Indica la situación de un área de descanso.",
//                            images: ["S123"],
//                            wrongAnswers: [
//                                "Área de picnic", // Picnic area
//                                "Área de servicio", // Service area
//                                "Zona de acampada", // Camping area
//                                "Hotel o motel", // Hotel or motel
//                                "Restaurante", // Restaurant
//                                "Taller mecánico", // Repair shop
//                                "Parque nacional", // National park
//                                "Información turística" // Tourist information
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Servicio"
//                        ),
//                        TrafficSign(
//                            title: "Aparcamiento de usuarios del ferrocarril", // Railway users parking
//                            description: "Indica la situación de una zona de estacionamiento conectada con una estación de ferrocarril, y destinada principalmente para los vehículos de los usuarios que realizan una parte de su viaje en vehículo privado y la otra en ferrocarril.",
//                            images: ["S124"],
//                            wrongAnswers: [
//                                "Aparcamiento para metro", // Underground parking
//                                "Aparcamiento para autobuses", // Bus users parking
//                                "Área de servicio", // Service area
//                                "Hotel o motel", // Hotel or motel
//                                "Restaurante", // Restaurant
//                                "Teléfono de emergencia", // Emergency phone
//                                "Zona de pesca", // Fishing preserve
//                                "Monumento" // Monument
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Servicio"
//                        ),
//                        TrafficSign(
//                            title: "Aparcamiento de usuarios del metro", // Parking for underground railway users
//                            description: "Indica la situación de una zona de estacionamiento, conectada con una estación de metro, y destinada principalmente para los vehículos de los usuarios que realizan una parte de su viaje en vehículo privado y la otra en metro.",
//                            images: ["S125"],
//                            wrongAnswers: [
//                                "Aparcamiento ferroviario", // Railway users parking
//                                "Aparcamiento para autobuses", // Bus users parking
//                                "Área de servicio", // Service area
//                                "Restaurante", // Restaurant
//                                "Zona de acampada", // Camping area
//                                "Hotel o motel", // Hotel or motel
//                                "Parque nacional", // National park
//                                "Información turística" // Tourist information
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Servicio"
//                        ),
//                        TrafficSign(
//                            title: "Aparcamiento de usuarios del autobús", // Parking for bus users
//                            description: "Indica la situación de una zona de estacionamiento, conectada con una estación o una terminal de autobuses, y destinada principalmente para los vehículos privados de los usuarios que realizan una parte de su viaje en vehículo privado y la otra en autobús.",
//                            images: ["S126"],
//                            wrongAnswers: [
//                                "Aparcamiento ferroviario", // Railway parking
//                                "Aparcamiento de metro", // Metro users parking
//                                "Área de servicio", // Service area
//                                "Restaurante", // Restaurant
//                                "Zona de pesca", // Fishing area
//                                "Hotel o motel", // Hotel or motel
//                                "Teléfono de emergencia", // Emergency phone
//                                "Información turística" // Tourist information
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Servicio"
//                        ),
//                        TrafficSign(
//                            title: "Área de servicio", // Service area
//                            description: "Indica la situación de un área de servicio en la carretera, donde los conductores pueden repostar, descansar o utilizar servicios complementarios como restaurantes, talleres o alojamientos.", // Indicates the location of a service area on the road where drivers can refuel, rest, or use additional services such as restaurants, repair shops, or lodging.
//                            images: ["S127"],
//                            wrongAnswers: [
//                                "Área de descanso", // Rest area
//                                "Estación de servicio", // Fuel station
//                                "Taller mecánico", // Repair shop
//                                "Hotel o motel", // Hotel or motel
//                                "Restaurante", // Restaurant
//                                "Zona de acampada", // Camping area
//                                "Puesto de socorro", // First aid station
//                                "Información turística" // Tourist information
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Servicio"
//                        ),
//                        TrafficSign(
//                            title: "Punto de vaciado de caravanas y autocaravanas", // Caravan and motorhome waste disposal point
//                            description: "Indica la ubicación de un punto de vaciado de aguas residuales destinado a caravanas y autocaravanas, donde los usuarios pueden evacuar los depósitos de forma segura y controlada.", // Indicates the location of a wastewater disposal point for caravans and motorhomes, allowing safe and controlled emptying.
//                            images: ["S128"],
//                            wrongAnswers: [
//                                "Área de servicio", // Service area
//                                "Área de descanso", // Rest area
//                                "Estación de servicio", // Fuel station
//                                "Taller mecánico", // Repair shop
//                                "Zona de acampada", // Camping area
//                                "Puesto de socorro", // Aid station
//                                "Hotel o motel", // Hotel or motel
//                                "Parking público" // Public parking
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Servicio"
//                        ),
//                        TrafficSign(
//                            title: "Estacionamiento de emergencia por nevadas", // Emergency parking due to snow
//                            description: "Indica la ubicación de un estacionamiento de emergencia habilitado para su uso en caso de nevadas intensas o, excepcionalmente, ante otras incidencias que impidan continuar la circulación con seguridad.", // Indicates the location of an emergency parking area for use during heavy snowfalls or, exceptionally, other incidents preventing safe travel.
//                            images: ["S129"],
//                            wrongAnswers: [
//                                "Área de descanso", // Rest area
//                                "Área de servicio", // Service area
//                                "Zona de acampada", // Camping area
//                                "Punto de vaciado de caravanas y autocaravanas", // Caravan waste disposal point
//                                "Taller mecánico", // Repair shop
//                                "Puesto de socorro", // Aid station
//                                "Carretera cortada por nieve" // Road closed due to snow
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Servicio"
//                        )
//                    ]
//                ),
//                TrafficSubSection(
//                    index: 3,
//                    name: "Señales de Orientación",
//                    description: "Guían al conductor a lo largo del recorrido, mostrando destinos, direcciones, distancias y rutas recomendadas. Facilitan la navegación por carreteras y zonas urbanas.",
//                    signs: [
//                        TrafficSign(
//                            title: "Preseñalización de rotonda", // Advance direction sign for a roundabout
//                            description: "Indica las direcciones de las diferentes salidas de la próxima rotonda o glorieta, incluida la glorieta partida. Si alguna inscripción aparece sobre fondo verde o azul, indica que la salida conduce a una vía rápida, autovía o autopista.", // Indicates the directions of the different exits of the next roundabout, including divided roundabouts. A green or blue background means the exit leads to an expressway, dual carriageway, or motorway.
//                            images: ["S200", "S201", "S202"],
//                            wrongAnswers: [
//                                "Preseñalización de área de servicio", // Pre-signaling of service area
//                                "Itinerario recomendado", // Recommended route
//                                "Cambio de sentido", // U-turn
//                                "Final de autopista", // End of motorway
//                                "Área de descanso", // Rest area
//                                "Cruce de calzadas", // Road intersection
//                                "Carril bus", // Bus lane
//                                "Dirección obligatoria" // Mandatory direction
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Orientación"
//                        ),
//                        TrafficSign(
//                            title: "Preseñalización de rotonda con selección de carriles", // Advance direction sign for a roundabout with lane selection
//                            description: "Indica las direcciones de las distintas salidas de la próxima rotonda y el carril por el que acceder a cada una de ellas.", // Indicates the directions of the different exits of the upcoming roundabout and the lane to use for each
//                            images: ["S203"],
//                            wrongAnswers: [
//                                "Preseñalización de área de servicio", // Pre-signaling of service area
//                                "Intersección con prioridad", // Intersection with priority
//                                "Cambio de sentido", // U-turn
//                                "Itinerario alternativo", // Alternate route
//                                "Carril reversible", // Reversible lane
//                                "Carril reservado para autobuses", // Bus lane
//                                "Zona de adelantamiento prohibido" // No overtaking zone
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Orientación"
//                        ),
//                        TrafficSign(
//                            title: "Preseñalización de direcciones hacia carretera convencional", // Pre-signaling of directions towards a conventional road
//                            description: "Indica, en una carretera convencional, las direcciones de los diferentes ramales del próximo cruce cuando uno de ellos conduce a otra carretera convencional.", // Indicates, on a conventional road, the directions of the different branches of the next intersection when one leads to another conventional road.
//                            images: ["S220"],
//                            wrongAnswers: [
//                                "Preseñalización hacia autopista", // Pre-signaling towards motorway
//                                "Preseñalización de área de servicio", // Pre-signaling of service area
//                                "Preseñalización de dos salidas próximas", // Two close exits
//                                "Itinerario pre-marcado", // Pre-marking itinerary
//                                "Preseñalización de carriles", // Lane pre-signaling
//                                "Zona de acampada", // Camping area
//                                "Información turística", // Tourist information
//                                "Carril reversible" // Reversible lane
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Orientación"
//                        ),
//                        
//                        TrafficSign(
//                            title: "Preseñalización hacia autopista o autovía", // Pre-signaling of directions towards a motorway or dual carriageway
//                            description: "Indica, en una carretera convencional, las direcciones de los diferentes ramales del próximo cruce cuando uno de ellos conduce a una autopista o autovía.", // Indicates, on a conventional road, the directions of the branches of the next intersection when one leads to a motorway or dual carriageway.
//                            images: ["S222"],
//                            wrongAnswers: [
//                                "Preseñalización de rotonda", // Roundabout pre-signaling
//                                "Preseñalización de área de descanso", // Rest area pre-signaling
//                                "Itinerario pre-marcado", // Itinerary pre-marking
//                                "Preseñalización de carril", // Lane pre-signaling
//                                "Parque nacional", // National park
//                                "Zona de acampada", // Camp area
//                                "Área de servicio", // Service area
//                                "Cafetería" // Coffee shop
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Orientación"
//                        ),
//                        
//                        TrafficSign(
//                            title: "Preseñalización hacia autopista o autovía con dirección propia", // Pre-signaling towards motorway or dual carriageway with
//                            description: "Indica, en una carretera convencional, las direcciones de los diferentes ramales del próximo cruce cuando uno de ellos conduce a una autopista o autovía, e incluye también la dirección de la carretera convencional.", // Indicates, on a conventional road, the directions of the next intersection when one leads to a motorway or dual carriageway, including the conventional road’s own direction.
//                            images: ["S222a"],
//                            wrongAnswers: [
//                                "Preseñalización de servicio", // Service pre-signaling
//                                "Itinerario pre-marcado", // Itinerary pre-marking
//                                "Preseñalización de dos salidas", // Two close exits
//                                "Área de descanso", // Rest area
//                                "Zona de acampada", // Camp area
//                                "Lugar pintoresco", // Picturesque place
//                                "Coto de pesca", // Fishing preserve
//                                "Carril adicional" // Additional lane
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Orientación"
//                        ),
//                        
//                        TrafficSign(
//                            title: "Preseñalización en autopista o autovía hacia cualquier vía", // Pre-signaling on a motorway or dual carriageway to any road
//                            description: "Indica las direcciones de las diferentes salidas del próximo cruce en una autopista o autovía, así como la distancia, el número y, en su caso, la letra del enlace.", // Indicates the directions of the branches at the next interchange on a motorway or dual carriageway, including distance and junction number.
//                            images: ["S225"],
//                            wrongAnswers: [
//                                "Preseñalización hacia carretera convencional", // Towards conventional road
//                                "Preseñalización de servicio", // Service road
//                                "Itinerario pre-marcado", // Pre-marked route
//                                "Área de descanso", // Rest area
//                                "Preseñalización de dos salidas próximas", // Two close exits
//                                "Parque nacional", // National park
//                                "Cafetería", // Coffee shop
//                                "Teléfono de emergencia" // Emergency phone
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Orientación"
//                        ),
//                        
//                        TrafficSign(
//                            title: "Preseñalización con carteles en calzada hacia carretera convencional", // Pre-signaling with road signs towards a conventional road
//                            description: "Indica las direcciones del ramal de la próxima salida y la distancia hasta ella.", // Indicates the direction and distance of the next exit branch on a conventional road.
//                            images: ["S230"],
//                            wrongAnswers: [
//                                "Preseñalización de servicio", // Service pre-signaling
//                                "Itinerario pre-marcado", // Itinerary pre-marking
//                                "Área de descanso", // Rest area
//                                "Zona de acampada", // Camping area
//                                "Carril adicional", // Additional lane
//                                "Preseñalización de dos salidas", // Two close exits
//                                "Taller mecánico", // Repair shop
//                                "Hotel o motel" // Hotel or motel
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Orientación"
//                        ),
//                        
//                        TrafficSign(
//                            title: "Preseñalización con dirección propia hacia carretera convencional", // Pre-signaling with own direction towards a conventional road
//                            description: "Indica las direcciones del ramal de la próxima salida, la distancia hasta ella y la dirección propia de la carretera convencional.", // Indicates the directions of the next exit branch, its distance, and the conventional road’s own direction.
//                            images: ["S230a"],
//                            wrongAnswers: [
//                                "Preseñalización de área de servicio", // Service area pre-signaling
//                                "Preseñalización de dos salidas próximas", // Two close exits
//                                "Parque nacional", // National park
//                                "Zona de acampada", // Camping area
//                                "Itinerario pre-marcado", // Pre-marked itinerary
//                                "Teléfono de emergencia", // Emergency phone
//                                "Restaurante", // Restaurant
//                                "Coto de pesca" // Fishing preserve
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Orientación"
//                        ),
//                        
//                        TrafficSign(
//                            title: "Preseñalización con carteles en calzada hacia autopista o autovía", // Pre-signaling with road signs towards a motorway or dual carriageway
//                            description: "Indica las direcciones del ramal de la próxima salida y la distancia hasta ella.", // Indicates the directions and distance of the next exit branch towards a motorway or dual carriageway.
//                            images: ["S232"],
//                            wrongAnswers: [
//                                "Preseñalización hacia carretera convencional", // Towards conventional road
//                                "Itinerario pre-marcado", // Pre-marked itinerary
//                                "Preseñalización de dos salidas próximas", // Two close exits
//                                "Área de descanso", // Rest area
//                                "Taller mecánico", // Repair shop
//                                "Cafetería", // Coffee shop
//                                "Zona de pesca", // Fishing area
//                                "Carril reversible" // Reversible lane
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Orientación"
//                        ),
//                        
//                        TrafficSign(
//                            title: "Preseñalización hacia autopista o autovía con dirección propia", // Pre-signaling towards motorway or dual carriageway with own direction
//                            description: "Indica las direcciones del ramal de la próxima salida, la distancia y la dirección propia de la carretera.", // Indicates the next exit directions, distance, and the motorway’s own direction.
//                            images: ["S232a"],
//                            wrongAnswers: [
//                                "Preseñalización de servicio", // Service pre-signaling
//                                "Preseñalización de área de descanso", // Rest area pre-signaling
//                                "Zona de acampada", // Camping area
//                                "Área de servicio", // Service area
//                                "Monumento", // Monument
//                                "Coto de pesca", // Fishing preserve
//                                "Hotel o motel", // Hotel or motel
//                                "Parque nacional" // National park
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Orientación"
//                        ),
//                        
//                        TrafficSign(
//                            title: "Preseñalización en autopista o autovía hacia cualquier vía", // Pre-signaling on motorway or dual carriageway towards any road
//                            description: "Indica las direcciones de la salida, la distancia y el número del enlace correspondiente.", // Indicates the next exit’s directions, distance, and junction number.
//                            images: ["S235"],
//                            wrongAnswers: [
//                                "Preseñalización de rotonda", // Roundabout pre-signaling
//                                "Itinerario pre-marcado", // Itinerary pre-marking
//                                "Área de descanso", // Rest area
//                                "Preseñalización de dos salidas", // Two close exits
//                                "Cafetería", // Coffee shop
//                                "Taller mecánico", // Repair shop
//                                "Zona de pesca", // Fishing area
//                                "Teléfono de emergencia" // Emergency phone
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Orientación"
//                        ),
//                        
//                        TrafficSign(
//                            title: "Preseñalización en autopista o autovía con dirección propia", // Pre-signaling on motorway or dual carriageway with own direction
//                            description: "Indica las direcciones de la próxima salida, la distancia, el número del enlace y la dirección propia de la autopista o autovía.", // Indicates the next exit directions, distance, junction number, and the motorway’s own direction.
//                            images: ["S235a"],
//                            wrongAnswers: [
//                                "Preseñalización de dos salidas", // Two close exits
//                                "Itinerario pre-marcado", // Pre-marked route
//                                "Área de servicio", // Service area
//                                "Área de descanso", // Rest area
//                                "Coto de pesca", // Fishing preserve
//                                "Zona de acampada", // Camping area
//                                "Restaurante", // Restaurant
//                                "Hotel o motel" // Hotel or motel
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Orientación"
//                        ),
//                        TrafficSign(
//                            title: "Preseñalización en autopista o autovía de dos salidas próximas", // Pre-signaling on a motorway or dual carriageway of two close exits
//                            description: "Indica las direcciones de las ramas de dos salidas consecutivas en una autopista o autovía, la distancia, el número del enlace y la letra de cada salida. Puede incluir también la dirección propia de la vía.", // Indicates the directions of two consecutive exits on a motorway or dual carriageway, including distance, interchange number, exit letters, and sometimes the road’s own direction.
//                            images: ["S242", "S242a", "S242b"],
//                            wrongAnswers: [
//                                "Preseñalización hacia autopista o autovía", // Pre-signaling towards motorway
//                                "Preseñalización de área de servicio", // Service area pre-signaling
//                                "Preseñalización con carteles en calzada", // Pre-signaling with on-road signs
//                                "Preseñalización de rotonda", // Roundabout pre-signaling
//                                "Carril adicional", // Additional lane
//                                "Área de descanso", // Rest area
//                                "Zona de acampada", // Camping area
//                                "Restaurante" // Restaurant
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Orientación"
//                        ),
//                        TrafficSign(
//                            title: "Preseñalización complementaria de poblaciones", // Complementary advance direction sign for nearby towns
//                            description: "Indica, en una carretera convencional o multicarril, las poblaciones cercanas de más de 5.000 habitantes a las que se puede acceder por el siguiente nudo o desde la salida que figura en el subcartel superior, así como la distancia hasta esta.", // Indicates, on a conventional or multi-lane road, nearby towns with more than 5,000 inhabitants that can be reached via the next junction or from the exit shown in the upper panel, and the distance to that exit.
//                            images: ["S245", "S246"],
//                            wrongAnswers: [
//                                "Preseñalización de salidas en variante de población", // Pre-signing of exits on town bypass
//                                "Preseñalización de área de servicio", // Pre-signing of service area
//                                "Preseñalización de rotonda", // Roundabout pre-signing
//                                "Preseñalización de dos salidas próximas", // Pre-signing of two nearby exits
//                                "Itinerario pre-marcado", // Pre-marked itinerary
//                                "Cambio de sentido", // U-turn
//                                "Intersección con prioridad", // Priority intersection
//                                "Área de descanso" // Rest area
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Orientación"
//                        ),
//                        TrafficSign(
//                            title: "Preseñalización de salidas en variante de población", // Advance direction sign for exits on a town bypass
//                            description: "Indica el número de las distintas salidas de la variante de una población, acompañado por el nombre de la vía de penetración o el punto cardinal correspondiente.", // Indicates the numbers of the different exits on a town bypass, together with the name of the penetration road or the corresponding cardinal direction.
//                            images: ["S247a", "S247b"],
//                            wrongAnswers: [
//                                "Preseñalización complementaria de poblaciones", // Complementary pre-signing of nearby towns
//                                "Preseñalización de área de servicio", // Pre-signing of service area
//                                "Preseñalización de rotonda", // Roundabout pre-signing
//                                "Preseñalización de dos salidas próximas", // Pre-signing of two nearby exits
//                                "Itinerario pre-marcado", // Pre-marked route
//                                "Cambio de sentido", // U-turn
//                                "Intersección con prioridad", // Priority intersection
//                                "Área de descanso" // Rest area
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Orientación"
//                        ),
//                        TrafficSign(
//                            title: "Itinerario pre-marcado", // Itinerary pre-marking
//                            description: "Indica el itinerario que debe seguirse para tomar la dirección indicada por la flecha.", // Indicates the route that must be followed to take the direction indicated by the arrow.
//                            images: ["S250"],
//                            wrongAnswers: [
//                                "Preseñalización de rotonda", // Roundabout pre-signaling
//                                "Preseñalización de dos salidas próximas", // Two close exits
//                                "Preseñalización hacia autopista", // Pre-signaling towards motorway
//                                "Área de descanso", // Rest area
//                                "Zona de acampada", // Camp area
//                                "Área de servicio", // Service area
//                                "Monumento", // Monument
//                                "Hotel o motel" // Hotel or motel
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Orientación"
//                        ),
//                        
//                        TrafficSign(
//                            title: "Preseñalización de carriles", // Lane pre-marking
//                            description: "Indica las únicas direcciones permitidas, en el próximo cruce, para los usuarios que circulan por los carriles designados.", // Indicates the only allowed directions, at the next intersection, for users in the indicated lanes.
//                            images: ["S260"],
//                            wrongAnswers: [
//                                "Preseñalización de rotonda", // Roundabout pre-signaling
//                                "Preseñalización de servicio", // Service pre-signaling
//                                "Itinerario pre-marcado", // Itinerary pre-marking
//                                "Preseñalización de dos salidas", // Two close exits
//                                "Carril adicional", // Additional lane
//                                "Área de descanso", // Rest area
//                                "Zona de acampada", // Camping area
//                                "Parque nacional" // National park
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Orientación"
//                        ),
//                        
//                        // 1️⃣ Preseñalización de área de servicio — Service Area (S261, S263, S263a)
//                        TrafficSign(
//                            title: "Preseñalización de área de servicio", // Advance direction sign for a service area
//                            description: "Indica la proximidad de una salida hacia un área de servicio, tanto en carreteras convencionales como en autopistas o autovías, pudiendo tratarse de una salida compartida con otras poblaciones o de una salida exclusiva.",
//                            // Indicates the proximity of an exit leading to a service area, on either conventional roads or motorways/dual carriageways, which may be shared with nearby towns or be exclusive to the service area.
//                            images: ["S261", "S263", "S263a"],
//                            wrongAnswers: [
//                                "Preseñalización de rotonda", // Roundabout pre-signing
//                                "Preseñalización de dos salidas próximas", // Two close exits
//                                "Preseñalización con selección de carriles", // Lane-selection pre-signing
//                                "Preseñalización de cambio de sentido", // U-turn pre-signing
//                                "Itinerario recomendado", // Recommended route
//                                "Intersección con prioridad", // Priority intersection
//                                "Carril reversible", // Reversible lane
//                                "Preseñalización de peaje" // Toll pre-signing
//                            ],
//                            sectionName: "Señales de Indicaciones", // Information signs
//                            subSectionName: "Señales de Orientación" // Direction signs
//                        ),
//                        
//                        // 2️⃣ Preseñalización de vía de servicio — Service Road (S264, S266, S266a)
//                        TrafficSign(
//                            title: "Preseñalización de vía de servicio", // Advance direction sign for a service road
//                            description: "Indica la proximidad de una salida hacia una vía de servicio, desde la cual se puede acceder a los servicios indicados. Puede encontrarse tanto en carreteras convencionales como en autopistas o autovías, con salida compartida o exclusiva.",
//                            // Indicates the proximity of an exit leading to a service road providing access to the indicated services. Found on both conventional roads and motorways/dual carriageways, with shared or exclusive exits.
//                            images: ["S264", "S266", "S266a"],
//                            wrongAnswers: [
//                                "Preseñalización de rotonda", // Roundabout pre-signing
//                                "Preseñalización de dos salidas próximas", // Two close exits
//                                "Preseñalización con selección de carriles", // Lane-selection pre-signing
//                                "Cambio de sentido", // U-turn
//                                "Intersección con prioridad", // Priority intersection
//                                "Itinerario alternativo", // Alternate route
//                                "Preseñalización de peaje", // Toll pre-signing
//                                "Preseñalización de túnel" // Tunnel pre-signing
//                            ],
//                            sectionName: "Señales de Indicaciones", // Information signs
//                            subSectionName: "Señales de Orientación" // Direction signs
//                        ),
//                        
//                        // 3️⃣ Preseñalización de servicios varios — Various Services (S267)
//                        TrafficSign(
//                            title: "Preseñalización de servicios varios", // Advance direction sign for various services
//                            description: "Indica, en una carretera convencional o multicarril, la proximidad de una salida hacia los servicios señalizados, tales como urbanización, puerto deportivo, zona deportiva, zona comercial, polígono industrial, parque empresarial o zona de ocio. En el cajetín superior figura la distancia a la salida.",
//                            // Indicates, on a conventional or multi-lane road, the proximity of an exit leading to signposted services such as a residential area, marina, sports zone, shopping area, industrial park, business park, or leisure complex. The upper box shows the distance to the exit.
//                            images: ["S267"],
//                            wrongAnswers: [
//                                "Preseñalización de rotonda", // Roundabout pre-signing
//                                "Preseñalización de dos salidas próximas", // Two close exits
//                                "Preseñalización con selección de carriles", // Lane-selection pre-signing
//                                "Itinerario recomendado", // Recommended route
//                                "Cambio de sentido", // U-turn
//                                "Intersección con prioridad", // Priority intersection
//                                "Carril reversible", // Reversible lane
//                                "Preseñalización de peaje" // Toll pre-signing
//                            ],
//                            sectionName: "Señales de Indicaciones", // Information signs
//                            subSectionName: "Señales de Orientación" // Direction signs
//                        ),
//                        
//                        //            TrafficSign(
//                        //                title: "Preseñalización de dos salidas próximas", // Pre-signaling of two close exits
//                        //                section: "Señales de Indicaciones",
//                        //                subSection: "Señales de Orientación",
//                        //                description: "Señal S-270 que indica la proximidad de dos salidas consecutivas entre las cuales no es posible instalar preseñales individualizadas por falta de distancia suficiente. Las letras o números corresponden a las preseñales anteriores.", // Sign S-270 indicates two consecutive exits between which separate pre-signs cannot be installed due to insufficient distance.
//                        //                images: ["S270"],
//                        //                wrongAnswers: [
//                        //                    "Preseñalización de rotonda", // Roundabout pre-signaling
//                        //                    "Itinerario pre-marcado", // Pre-marking itinerary
//                        //                    "Preseñalización de carriles", // Lane pre-signing
//                        //                    "Área de descanso", // Rest area
//                        //                    "Zona de acampada", // Camp area
//                        //                    "Hotel o motel", // Hotel or motel
//                        //                    "Monumento", // Monument
//                        //                    "Parque nacional" // National park
//                        //                ]
//                        //            ),
//                        
//                        TrafficSign(
//                            title: "Preseñalización de un área de servicio", // Pre-signaling of a service area
//                            description: "Indica, en una autopista o autovía, la salida hacia un área de servicio.", // Indicates, on a motorway or dual carriageway, the exit to a service area.
//                            images: ["S271"],
//                            wrongAnswers: [
//                                "Preseñalización de dos salidas próximas", // Two close exits
//                                "Itinerario pre-marcado", // Pre-marked itinerary
//                                "Preseñalización de carriles", // Lane pre-signing
//                                "Preseñalización de rotonda", // Roundabout pre-signing
//                                "Área de descanso", // Rest area
//                                "Zona de acampada", // Camping area
//                                "Restaurante", // Restaurant
//                                "Cafetería" // Coffee shop
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Orientación"
//                        ),
//                        // Sub category: Señales de Dirección
//                        TrafficSign(
//                            title: "Poblaciones en itinerario de carretera convencional", // Towns of a conventional road itinerary
//                            description: "Indica los nombres de las poblaciones situadas en un itinerario formado por una carretera convencional y la dirección por la que se alcanzan. El recuadro dentro de la señal define la categoría y el número de la carretera. Las cifras indican la distancia en kilómetros.", // Indicates the names of towns along a conventional road route, the direction they are reached, and the distances in kilometers.
//                            images: ["S300"],
//                            wrongAnswers: [
//                                "Poblaciones en itinerario de autopista", // Towns on a motorway itinerary
//                                "Lugares de interés", // Places of interest
//                                "Itinerario pre-marcado", // Pre-marked route
//                                "Preseñalización de rotonda", // Roundabout pre-signing
//                                "Área de descanso", // Rest area
//                                "Zona de acampada", // Camping area
//                                "Información turística", // Tourist information
//                                "Carril adicional" // Additional lane
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Orientación"
//                        ),
//                        
//                        TrafficSign(
//                            title: "Poblaciones en itinerario de autopista o autovía", // Towns on a highway or dual carriageway itinerary
//                            description: "Indica los nombres de las poblaciones situadas en un itinerario formado por una autopista o autovía y la dirección por la que se alcanzan. El recuadro dentro de la señal define la categoría y el número de la carretera. Las cifras indican la distancia en kilómetros.", // Indicates the names of towns along a motorway or dual carriageway, their direction, and distance in kilometers.
//                            images: ["S301"],
//                            wrongAnswers: [
//                                "Poblaciones en carretera convencional", // Towns on conventional road
//                                "Lugares de interés", // Places of interest
//                                "Preseñalización de servicio", // Service pre-signing
//                                "Área de servicio", // Service area
//                                "Preseñalización de carriles", // Lane pre-signing
//                                "Zona de acampada", // Camping area
//                                "Restaurante", // Restaurant
//                                "Parque nacional" // National park
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Orientación"
//                        ),
//                        
//                        TrafficSign(
//                            title: "Poblaciones de diferentes itinerarios", // Towns of different itineraries
//                            description: "Indica las carreteras y poblaciones que se alcanzan en la dirección señalada por la flecha.", // Indicates the roads and towns reached in the direction indicated by the arrow.
//                            images: ["S310"],
//                            wrongAnswers: [
//                                "Poblaciones en itinerario de autopista", // Towns on motorway route
//                                "Lugares de interés", // Places of interest
//                                "Preseñalización de rotonda", // Roundabout pre-signing
//                                "Área de servicio", // Service area
//                                "Coto de pesca", // Fishing preserve
//                                "Hotel o motel", // Hotel or motel
//                                "Zona de acampada", // Camp area
//                                "Monumento" // Monument
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Orientación"
//                        ),
//                        
//                        TrafficSign(
//                            title: "Lugares de interés en carretera convencional", // Places of interest on a conventional road
//                            description: "Indica lugares de interés general que no son poblaciones, situados en un itinerario formado por una carretera convencional. Las cifras indican la distancia en kilómetros.", // Indicates places of general interest (not towns) located on a conventional road, with distances in kilometers.
//                            images: ["S320"],
//                            wrongAnswers: [
//                                "Lugares de interés en autopista", // Places of interest on motorway
//                                "Poblaciones de itinerario", // Towns of an itinerary
//                                "Preseñalización de servicio", // Service pre-signing
//                                "Itinerario pre-marcado", // Pre-marking
//                                "Área de descanso", // Rest area
//                                "Restaurante", // Restaurant
//                                "Zona de acampada", // Camping area
//                                "Monumento" // Monument
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Orientación"
//                        ),
//                        
//                        TrafficSign(
//                            title: "Lugares de interés en autopista o autovía", // Places of interest on a motorway or dual carriageway
//                            description: "Indica lugares de interés que no son poblaciones, situados en un itinerario formado por una autopista o autovía. Las cifras indican la distancia en kilómetros.", // Indicates places of interest (not towns) located along a motorway or dual carriageway, with distances in kilometers.
//                            images: ["S321"],
//                            wrongAnswers: [
//                                "Lugares de interés en carretera convencional", // Places of interest on conventional road
//                                "Poblaciones de diferentes itinerarios", // Towns of different itineraries
//                                "Preseñalización de servicio", // Service pre-signing
//                                "Área de descanso", // Rest area
//                                "Cafetería", // Coffee shop
//                                "Hotel o motel", // Hotel or motel
//                                "Monumento", // Monument
//                                "Zona de acampada" // Camp area
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Orientación"
//                        ),
//                        
//                        TrafficSign(
//                            title: "Destino hacia carril bici o vía ciclista", // Destination sign towards a cycle lane or path
//                            description: "Indica la existencia de un carril o vía ciclista en la dirección señalada por la flecha. Las cifras dentro de la señal indican la distancia en kilómetros.", // Indicates the existence of a cycle path in the direction indicated by the arrow, with distance in kilometers.
//                            images: ["S322"],
//                            wrongAnswers: [
//                                "Preseñalización de rotonda", // Roundabout pre-signing
//                                "Lugares de interés", // Places of interest
//                                "Poblaciones de itinerario", // Towns of itinerary
//                                "Itinerario pre-marcado", // Pre-marked route
//                                "Área de servicio", // Service area
//                                "Zona de acampada", // Camping area
//                                "Restaurante", // Restaurant
//                                "Coto de pesca" // Fishing area
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Orientación"
//                        ),
//                        
//                        TrafficSign(
//                            title: "Destino inmediato hacia carretera convencional", // Immediate departure destination signs to conventional road
//                            description: "Indica el punto de salida desde una autopista o autovía hacia otra autopista o hacia una carretera convencional. La cifra indica el número del enlace.", // Indicates the exit point from a motorway to another motorway or to a conventional road, showing the interchange number.
//                            images: ["S341"],
//                            wrongAnswers: [
//                                "Destino inmediato hacia autopista", // Immediate exit to motorway
//                                "Preseñalización de dos salidas próximas", // Two close exits
//                                "Itinerario pre-marcado", // Pre-marked route
//                                "Área de descanso", // Rest area
//                                "Zona de acampada", // Camping area
//                                "Carril adicional", // Additional lane
//                                "Restaurante", // Restaurant
//                                "Monumento" // Monument
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Orientación"
//                        ),
//                        
//                        TrafficSign(
//                            title: "Destino inmediato hacia autopista o autovía", // Immediate exit destination signs to motorway or dual carriageway
//                            description: "Indica el punto de salida desde una autopista o autovía hacia otra autopista o autovía. La cifra indica el número del enlace.", // Indicates the exit point from a motorway to another motorway or dual carriageway, showing the interchange number.
//                            images: ["S342"],
//                            wrongAnswers: [
//                                "Destino inmediato hacia carretera convencional", // Immediate exit to conventional road
//                                "Preseñalización de área de servicio", // Service area pre-signing
//                                "Itinerario pre-marcado", // Pre-marked route
//                                "Preseñalización de rotonda", // Roundabout pre-signing
//                                "Zona de acampada", // Camping area
//                                "Cafetería", // Coffee shop
//                                "Monumento", // Monument
//                                "Restaurante" // Restaurant
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Orientación"
//                        ),
//                        
//                        TrafficSign(
//                            title: "Destino inmediato hacia área de servicio", // Immediate exit destination to a road service area
//                            description: "Indica el punto de salida desde cualquier carretera hacia un área de servicio.", // Indicates the exit point from any road to a service area.
//                            images: ["S344"],
//                            wrongAnswers: [
//                                "Preseñalización de área de descanso", // Rest area pre-signing
//                                "Destino inmediato hacia autopista", // Exit to motorway
//                                "Preseñalización compartida", // Shared exit pre-signing
//                                "Itinerario pre-marcado", // Pre-marked route
//                                "Área de descanso", // Rest area
//                                "Zona de acampada", // Camp area
//                                "Hotel o motel", // Hotel or motel
//                                "Parque nacional" // National park
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Orientación"
//                        ),
//                        
//                        TrafficSign(
//                            title: "Destino inmediato hacia zona o área de servicio con salida compartida", // Immediate exit destination to zone or service area with shared exit
//                            description: "Indica el punto donde una carretera sale hacia una zona o área de servicio, siendo la misma salida que conduce a una autopista o autovía.", // Indicates the exit point to a service area or zone, sharing the same exit to a motorway or dual carriageway.
//                            images: ["S347"],
//                            wrongAnswers: [
//                                "Preseñalización de área de servicio", // Service area pre-signing
//                                "Destino inmediato hacia carretera convencional", // Immediate exit to conventional road
//                                "Itinerario pre-marcado", // Pre-marked route
//                                "Preseñalización de dos salidas", // Two close exits
//                                "Zona de acampada", // Camp area
//                                "Monumento", // Monument
//                                "Restaurante", // Restaurant
//                                "Hotel o motel" // Hotel or motel
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Orientación"
//                        ),
//                        
//                        //            TrafficSign(
//                        //                title: "Destino en itinerario de desvío", // Destination on diversion sign
//                        //                section: "Señales de Indicaciones",
//                        //                subSection: "Señales de Orientación",
//                        //                description: "Señal S-348a que indica que un determinado destino se alcanza por el itinerario provisional de desvío y en la dirección señalada por la flecha.", // Sign S-348a indicates that a certain destination is reached by a provisional diversion route in the direction indicated by the arrow.
//                        //                images: ["S348a"],
//                        //                wrongAnswers: [
//                        //                    "Destino variable", // Variable destination
//                        //                    "Preseñalización de rotonda", // Roundabout pre-signing
//                        //                    "Preseñalización de carriles", // Lane pre-signing
//                        //                    "Preseñalización de área de descanso", // Rest area
//                        //                    "Área de servicio", // Service area
//                        //                    "Zona de acampada", // Camp area
//                        //                    "Parque nacional", // National park
//                        //                    "Hotel o motel" // Hotel or motel
//                        //                ]
//                        //            ),
//                        //
//                        //            TrafficSign(
//                        //                title: "Destino variable", // Variable destination sign
//                        //                section: "Señales de Indicaciones",
//                        //                subSection: "Señales de Orientación",
//                        //                description: "Señal S-348b que indica que, en la dirección señalada por la flecha, se puede alcanzar el destino que aparece en la señal.", // Sign S-348b indicates that the destination shown can be reached in the direction indicated by the arrow.
//                        //                images: ["S348b"],
//                        //                wrongAnswers: [
//                        //                    "Destino en desvío", // Diversion destination
//                        //                    "Preseñalización de área de servicio", // Service area pre-signing
//                        //                    "Preseñalización de carriles", // Lane pre-signing
//                        //                    "Preseñalización de rotonda", // Roundabout pre-signing
//                        //                    "Área de descanso", // Rest area
//                        //                    "Restaurante", // Restaurant
//                        //                    "Cafetería", // Coffee shop
//                        //                    "Monumento" // Monument
//                        //                ]
//                        //            ),
//                        TrafficSign(
//                            title: "Señales en calzada", // On-road direction signs
//                            description: "Indican, en carreteras convencionales, autopistas o autovías, el punto donde comienza el ramal de salida, las direcciones alcanzadas por la salida inmediata y, en su caso, el número o la letra del enlace. Pueden mostrar también la dirección propia de la vía o incluir dos salidas consecutivas próximas.",
//                            // Indicates, on conventional roads, motorways, or dual carriageways, where the exit branch begins, the destinations reached by the immediate exit, and, when applicable, the interchange number or letter. They may also show the main road’s own direction or depict two consecutive exits when close together.
//                            images: ["S350", "S351", "S354", "S355", "S360", "S366", "S368", "S371", "S373", "S375"],
//                            wrongAnswers: [
//                                "Preseñalización de área de servicio", // Service area pre-signing
//                                "Preseñalización de rotonda", // Roundabout pre-signing
//                                "Preseñalización de dos salidas próximas", // Pre-signing of two close exits
//                                "Itinerario pre-marcado", // Pre-marked route
//                                "Preseñalización de peaje", // Toll pre-signing
//                                "Cambio de sentido", // U-turn
//                                "Intersección con prioridad", // Priority intersection
//                                "Carril reversible" // Reversible lane
//                            ],
//                            sectionName: "Señales de Indicaciones", // Information signs
//                            subSectionName: "Señales de Orientación" // Direction signs
//                        ),
//                        TrafficSign(
//                            title: "Itinerario europeo", // European Itinerary
//                            description: "Identifica un itinerario perteneciente a la Red de Carreteras Europeas.", // Identifies a route that is part of the European Road Network.
//                            images: ["S400"],
//                            wrongAnswers: [
//                                "Autopista o autovía", // Motorway or dual carriageway
//                                "Carretera regional de primer nivel", // First-level regional road
//                                "Carretera general del Estado", // State road
//                                "Autopista de peaje", // Toll motorway
//                                "Carretera regional de segundo nivel", // Second-level regional road
//                                "Carretera regional de tercer nivel", // Third-level regional road
//                                "Itinerario pre-marcado", // Pre-marked route
//                                "Preseñalización de rotonda" // Roundabout pre-signing
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Orientación"
//                        ),
//                        
//                        TrafficSign(
//                            title: "Autopista o autovía", // Motorway or dual carriageway
//                            description: "Identifica una autopista o autovía. Cuando pertenece a una Comunidad Autónoma, además de la letra A, puede incluir las siglas de la Comunidad junto al número correspondiente. Ninguna vía que no cumpla las características de autopista o autovía puede identificarse con la letra A.", // Identifies a motorway or dual carriageway. Regional highways may include the initials of the autonomous region; only roads meeting motorway standards may use the letter A.
//                            images: ["S410"],
//                            wrongAnswers: [
//                                "Itinerario europeo", // European itinerary
//                                "Autopista de peaje", // Toll motorway
//                                "Carretera general del Estado", // State road
//                                "Carretera regional de primer nivel", // First-level regional road
//                                "Carretera regional de segundo nivel", // Second-level regional road
//                                "Carretera regional de tercer nivel", // Third-level regional road
//                                "Preseñalización de área de servicio", // Service area pre-signing
//                                "Itinerario pre-marcado" // Pre-marked route
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Orientación"
//                        ),
//                        
//                        TrafficSign(
//                            title: "Autopista de peaje", // Toll motorway
//                            description: "Identifica una autopista de peaje.", // Identifies a toll motorway.
//                            images: ["S410a"],
//                            wrongAnswers: [
//                                "Autopista o autovía gratuita", // Free motorway
//                                "Itinerario europeo", // European itinerary
//                                "Carretera general del Estado", // State road
//                                "Carretera regional de primer nivel", // First-level regional road
//                                "Carretera regional de segundo nivel", // Second-level regional road
//                                "Carretera regional de tercer nivel", // Third-level regional road
//                                "Preseñalización de peaje", // Toll pre-signing
//                                "Área de servicio" // Service area
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Orientación"
//                        ),
//                        
//                        TrafficSign(
//                            title: "Carretera de la Red General del Estado", // Road part of the general State road network
//                            description: "Identifica una carretera que forma parte de la Red General del Estado y que no es una autopista o autovía.", // Identifies a road belonging to the general State road network that is not a motorway or dual carriageway.
//                            images: ["S420"],
//                            wrongAnswers: [
//                                "Autopista o autovía", // Motorway or dual carriageway
//                                "Autopista de peaje", // Toll motorway
//                                "Itinerario europeo", // European itinerary
//                                "Carretera regional de primer nivel", // First-level regional road
//                                "Carretera regional de segundo nivel", // Second-level regional road
//                                "Carretera regional de tercer nivel", // Third-level regional road
//                                "Preseñalización de rotonda", // Roundabout pre-signing
//                                "Área de descanso" // Rest area
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Orientación"
//                        ),
//                        
//                        TrafficSign(
//                            title: "Carretera regional de primer nivel", // First-level regional road
//                            description: "Identifica una carretera regional de primer nivel, distinta de una autopista o autovía, perteneciente a la red de la Comunidad Autónoma correspondiente.", // Identifies a first-level regional road, not a motorway or dual carriageway, belonging to the network of the relevant autonomous region.
//                            images: ["S430"],
//                            wrongAnswers: [
//                                "Carretera regional de segundo nivel", // Second-level regional road
//                                "Carretera regional de tercer nivel", // Third-level regional road
//                                "Autopista de peaje", // Toll motorway
//                                "Carretera general del Estado", // State road
//                                "Autopista o autovía", // Motorway or dual carriageway
//                                "Itinerario europeo", // European itinerary
//                                "Área de descanso", // Rest area
//                                "Zona de acampada" // Camp area
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Orientación"
//                        ),
//                        
//                        TrafficSign(
//                            title: "Carretera regional de segundo nivel", // Second-level regional road
//                            description: "Identifica una carretera regional de segundo nivel, que no es autopista ni autovía, perteneciente a la red de la Comunidad Autónoma correspondiente.", // Identifies a second-level regional road, not a motorway or dual carriageway, belonging to the autonomous region’s road network.
//                            images: ["S440"],
//                            wrongAnswers: [
//                                "Carretera regional de primer nivel", // First-level regional road
//                                "Carretera regional de tercer nivel", // Third-level regional road
//                                "Autopista o autovía", // Motorway or dual carriageway
//                                "Carretera general del Estado", // State road
//                                "Autopista de peaje", // Toll motorway
//                                "Itinerario europeo", // European itinerary
//                                "Área de descanso", // Rest area
//                                "Cafetería" // Coffee shop
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Orientación"
//                        ),
//                        
//                        TrafficSign(
//                            title: "Carretera regional de tercer nivel", // Third-level regional road
//                            description: "Identifica una carretera regional de tercer nivel, que no es autopista ni autovía, perteneciente a la red de la Comunidad Autónoma correspondiente.", // Identifies a third-level regional road, not a motorway or dual carriageway, belonging to the autonomous region’s road network.
//                            images: ["S450"],
//                            wrongAnswers: [
//                                "Carretera regional de segundo nivel", // Second-level regional road
//                                "Carretera regional de primer nivel", // First-level regional road
//                                "Autopista o autovía", // Motorway or dual carriageway
//                                "Carretera general del Estado", // State road
//                                "Itinerario europeo", // European itinerary
//                                "Autopista de peaje", // Toll motorway
//                                "Área de descanso", // Rest area
//                                "Zona de acampada" // Camp area
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Orientación"
//                        ),
//                        TrafficSign(
//                            title: "Entrada a poblado", // Entrance to the town
//                            description: "Indica que se ha entrado en una población y que, a partir de ese punto, se aplican las normas de circulación propias de poblado.", // Indicates entry into a town, where urban traffic regulations apply.
//                            images: ["S500"],
//                            wrongAnswers: [
//                                "Entrada a parque natural", // Entrance to natural park
//                                "Entrada a puerto de montaña", // Entrance to mountain pass
//                                "Entrada a zona industrial", // Entrance to industrial area
//                                "Entrada a área metropolitana", // Entrance to metropolitan area
//                                "Entrada a autopista de peaje", // Entrance to toll motorway
//                                "Entrada a túnel", // Entrance to tunnel
//                                "Entrada a recinto universitario", // Entrance to university campus
//                                "Entrada a zona portuaria" // Entrance to port area
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Orientación"
//                        ),
//                        
//                        TrafficSign(
//                            title: "Salida de poblado", // Exit of the town
//                            description: "Indica que se ha salido de una población y que, a partir de ese punto, dejan de aplicarse las normas de circulación en poblado.",
//                            // Indicates that you have left a town and that urban traffic regulations no longer apply.
//                            images: ["S510"],
//                            wrongAnswers: [
//                                "Salida de comunidad autónoma", // Exit from autonomous region
//                                "Salida de área metropolitana", // Exit from metropolitan area
//                                "Salida de puerto", // Exit from port area
//                                "Salida de túnel", // Exit from tunnel
//                                "Salida de autopista", // Exit from motorway
//                                "Salida de zona industrial", // Exit from industrial area
//                                "Salida de parque nacional" // Exit from national park
//                            ],
//                            sectionName: "Señales de Indicaciones", // Information signs
//                            subSectionName: "Señales de Orientación" // Direction signs
//                        ),
//                        
//                        TrafficSign(
//                            title: "Localización de punto característico de la carretera", // Location of characteristic point of the road
//                            description: "Indica un lugar de interés general situado a lo largo de la carretera.", // Indicates a place of general interest along the road.
//                            images: ["S520"],
//                            wrongAnswers: [
//                                "Entrada a poblado", // Entrance to town
//                                "Salida de poblado", // Exit of town
//                                "Hito kilométrico", // Kilometric milestone
//                                "Entrada a provincia", // Entrance to province
//                                "Entrada a comunidad autónoma", // Entrance to autonomous region
//                                "Lugar pintoresco", // Picturesque place
//                                "Área de descanso", // Rest area
//                                "Monumento" // Monument
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Orientación"
//                        ),
//                        // 1️⃣ Localización de túnel con información de seguridad — Tunnel location with safety information
//                        TrafficSign(
//                            title: "Localización de túnel con información de seguridad", // Tunnel location with safety information
//                            description: "Indica la localización de un túnel en una carretera convencional, multicarril, autopista o autovía, incluyendo información sobre sus instalaciones de seguridad y su longitud.",
//                            // Indicates the location of a tunnel on a conventional, multi-lane road, motorway, or dual carriageway, including details about its safety systems and length.
//                            images: ["S530", "S531"],
//                            wrongAnswers: [
//                                "Área de servicio próxima", // Nearby service area
//                                "Fin de carretera multicarril", // End of multi-lane road
//                                "Inicio de pendiente prolongada", // Start of long descent
//                                "Zona de adelantamiento prohibido", // No-overtaking zone
//                                "Cambio de sentido autorizado", // Authorized U-turn point
//                                "Paso inferior", // Underpass
//                                "Punto de emergencia", // Emergency point
//                                "Estrechamiento de calzada" // Road narrows
//                            ],
//                            sectionName: "Señales de Indicaciones", // Information signs
//                            subSectionName: "Señales de Orientación" // Direction signs
//                        ),
//                        
//                        // 2️⃣ Localización de túnel con obligaciones de circulación — Tunnel location with driving obligations
//                        TrafficSign(
//                            title: "Localización de túnel con obligaciones de circulación", // Tunnel location with driving obligations
//                            description: "Indica la localización de un túnel en una carretera convencional, multicarril, autopista o autovía, incluyendo información sobre las normas específicas de circulación que deben cumplirse en su interior.",
//                            // Indicates the location of a tunnel on any road type, including information about the specific traffic rules that must be observed inside it.
//                            images: ["S532", "S533"],
//                            wrongAnswers: [
//                                "Tramo con fuerte pendiente", // Section with steep grade
//                                "Carril reservado para vehículos lentos", // Lane reserved for slow vehicles
//                                "Zona con curvas peligrosas", // Dangerous curves ahead
//                                "Cruce con prioridad", // Priority junction
//                                "Cambio de sentido", // U-turn point
//                                "Salida de emergencia", // Emergency exit
//                                "Tramo con visibilidad reducida", // Reduced visibility section
//                                "Fin de autopista" // End of motorway
//                            ],
//                            sectionName: "Señales de Indicaciones", // Information signs
//                            subSectionName: "Señales de Orientación" // Direction signs
//                        ),
//                        
//                        // 1️⃣ Entrada a provincia — Entrance to the Province
//                        TrafficSign(
//                            title: "Entrada a provincia", // Entrance to the province
//                            description: "Indica la entrada a otra provincia.",
//                            // Indicates that you’ve entered another province.
//                            images: ["S540"],
//                            wrongAnswers: [
//                                "Entrada a parque natural", // Entrance to natural park
//                                "Entrada a puerto de montaña", // Entrance to mountain pass
//                                "Entrada a zona industrial", // Entrance to industrial area
//                                "Entrada a área metropolitana", // Entrance to metropolitan area
//                                "Entrada a autopista de peaje", // Entrance to toll motorway
//                                "Entrada a túnel", // Entrance to tunnel
//                                "Entrada a recinto universitario", // Entrance to university campus
//                                "Entrada a zona portuaria" // Entrance to port area
//                            ],
//                            sectionName: "Señales de Indicaciones", // Information signs
//                            subSectionName: "Señales de Orientación" // Direction signs
//                        ),
//                        
//                        // 2️⃣ Entrada a comunidad autónoma — Entrance to the Autonomous Region
//                        TrafficSign(
//                            title: "Entrada a comunidad autónoma", // Entrance to the autonomous region
//                            description: "Indica la entrada a una Comunidad Autónoma, mostrando únicamente su nombre.",
//                            // Indicates entry into an autonomous region, showing only its name.
//                            images: ["S550"],
//                            wrongAnswers: [
//                                "Entrada a parque nacional", // Entrance to national park
//                                "Entrada a estación de esquí", // Entrance to ski resort
//                                "Entrada a aeropuerto", // Entrance to airport
//                                "Entrada a zona residencial", // Entrance to residential area
//                                "Entrada a puerto marítimo", // Entrance to seaport
//                                "Entrada a complejo deportivo", // Entrance to sports complex
//                                "Entrada a zona universitaria", // Entrance to university area
//                                "Entrada a polígono industrial" // Entrance to industrial park
//                            ],
//                            sectionName: "Señales de Indicaciones", // Information signs
//                            subSectionName: "Señales de Orientación" // Direction signs
//                        ),
//                        
//                        // 3️⃣ Entrada a comunidad autónoma con provincia — Entrance to the Autonomous Region with Province
//                        TrafficSign(
//                            title: "Entrada a comunidad autónoma con provincia", // Entrance to the autonomous region with province
//                            description: "Indica la entrada a otra Comunidad Autónoma, mostrando el nombre de la región y de la provincia.",
//                            // Indicates entry into another autonomous region, showing both the region and province names.
//                            images: ["S560"],
//                            wrongAnswers: [
//                                "Entrada a parque natural", // Entrance to natural park
//                                "Entrada a aeropuerto internacional", // Entrance to international airport
//                                "Entrada a zona portuaria", // Entrance to port area
//                                "Entrada a recinto ferial", // Entrance to fairground
//                                "Entrada a centro logístico", // Entrance to logistics center
//                                "Entrada a complejo turístico", // Entrance to tourist complex
//                                "Entrada a estación de esquí", // Entrance to ski station
//                                "Entrada a parque tecnológico" // Entrance to tech park
//                            ],
//                            sectionName: "Señales de Indicaciones", // Information signs
//                            subSectionName: "Señales de Orientación" // Direction signs
//                        ),
//                        
//                        TrafficSign(
//                            title: "Hito kilométrico en autopista o autovía", // Kilometric milestone on a motorway or highway
//                            description: "Indica el punto kilométrico de la autopista o autovía cuya identificación aparece en la parte superior.", // Indicates the kilometer point of the motorway or dual carriageway, with its identifier shown at the top.
//                            images: ["S570"],
//                            wrongAnswers: [
//                                "Itinerario europeo", // European itinerary
//                                "Entrada a provincia", // Entrance to province
//                                "Entrada a comunidad autónoma", // Entrance to autonomous region
//                                "Área de servicio", // Service area
//                                "Zona de acampada", // Camping area
//                                "Restaurante" // Restaurant
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Orientación"
//                        ),
//                        
//                        TrafficSign(
//                            title: "Hito kilométrico en autopista de peaje", // Milestone on a toll motorway
//                            description: "Indica el punto kilométrico de una autopista de peaje cuya identificación aparece en la parte superior.", // Indicates the kilometer point of a toll motorway, with its identifier shown at the top.
//                            images: ["S570a"],
//                            wrongAnswers: [
//                                "Entrada a provincia", // Entrance to province
//                                "Entrada a comunidad autónoma", // Entrance to autonomous region
//                                "Entrada a poblado", // Entrance to town
//                                "Área de descanso", // Rest area
//                                "Cafetería" // Coffee shop
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Orientación"
//                        ),
//                        
//                        TrafficSign(
//                            title: "Hito kilométrico en autopista o autovía que forma parte de un itinerario europeo", // Kilometric milestone on a motorway that is part of a European itinerary
//                            description: "Indica el punto kilométrico de una autopista o autovía que también forma parte de un itinerario europeo, cuya identificación aparece en la parte superior de la señal.", // Indicates the kilometer point of a motorway or dual carriageway that is also part of a European route, with its identifier shown at the top.
//                            images: ["S571"],
//                            wrongAnswers: [
//                                "Entrada a provincia", // Entrance to province
//                                "Entrada a comunidad autónoma", // Entrance to autonomous region
//                                "Área de servicio", // Service area
//                                "Itinerario pre-marcado" // Pre-marked route
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Orientación"
//                        ),
//                        
//                        TrafficSign(
//                            title: "Hito kilométrico en carretera convencional", // Kilometric milestone on conventional road
//                            description: "Indica el punto kilométrico de una carretera convencional cuya identificación aparece en la parte superior, con el color de fondo que señala la red a la que pertenece: rojo para carreteras del Estado, naranja para primer nivel, verde para segundo y amarillo para tercer nivel.", // Indicates the kilometer point of a conventional road, with the background color representing its network type: red for State roads, orange for first level, green for second, and yellow for third.
//                            images: ["S572"],
//                            wrongAnswers: [
//                                "Entrada a provincia", // Entrance to province
//                                "Entrada a comunidad autónoma", // Entrance to autonomous region
//                                "Hito kilométrico europeo", // European milestone
//                                "Área de descanso", // Rest area
//                                "Zona de acampada", // Camping area
//                                "Itinerario europeo" // European itinerary
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Orientación"
//                        ),
//                        
//                        TrafficSign(
//                            title: "Hito kilométrico en itinerario europeo", // Kilometric milestone on European itinerary
//                            description: "Indica el punto kilométrico de una carretera convencional que forma parte de un itinerario europeo, mostrando en la parte superior las letras y números del itinerario. El color de fondo varía según la red: rojo para la red estatal y naranja para la red autonómica de primer nivel.", // Indicates the kilometer point of a conventional road that is part of a European route, with red for State roads and orange for first-level regional roads.
//                            images: ["S573"],
//                            wrongAnswers: [
//                                "Entrada a comunidad autónoma", // Entrance to autonomous region
//                                "Entrada a provincia", // Entrance to province
//                                "Área de servicio", // Service area
//                                "Parque nacional", // National park
//                                "Lugar pintoresco" // Picturesque place
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Orientación"
//                        ),
//                        
//                        TrafficSign(
//                            title: "Hito miriamétrico en autopista, autovía o carretera convencional", // Myriametric milestone on motorway, dual carriageway, or conventional road
//                            description: "Indica la posición en la vía cada diez kilómetros, mostrando el número de carretera y la distancia desde su origen. Se utiliza en autopistas, autovías y carreteras convencionales.",
//                            // Indicates the position on the road every ten kilometres, showing the road number and the distance from its origin. Used on motorways, dual carriageways, and conventional roads.
//                            images: ["S574", "S574a", "S574b"],
//                            wrongAnswers: [
//                                "Entrada a provincia", // Entrance to province
//                                "Entrada a comunidad autónoma", // Entrance to autonomous region
//                                "Área de descanso", // Rest area
//                                "Zona de acampada", // Camping area
//                                "Parque nacional", // National park
//                                "Monumento histórico", // Historical monument
//                                "Lugar pintoresco", // Scenic place
//                                "Punto kilométrico cero" // Kilometre zero point
//                            ],
//                            sectionName: "Señales de Indicaciones", // Information signs
//                            subSectionName: "Señales de Orientación" // Direction signs
//                        ),
//                        
//                        TrafficSign(
//                            title: "Hito miriamétrico", // Myriametric milestone
//                            description: "Indica el punto kilométrico de una carretera que no es autopista ni autovía cuando es múltiplo de 10. El color del fondo varía según el nivel de la red: naranja para primer nivel, verde para segundo y amarillo para tercer nivel.", // Indicates the kilometer point of a non-motorway road when it is a multiple of 10, with background color representing the network level: orange (1st), green (2nd), yellow (3rd).
//                            images: ["S575"],
//                            wrongAnswers: [
//                                "Entrada a provincia", // Entrance to province
//                                "Entrada a comunidad autónoma", // Entrance to autonomous region
//                                "Entrada a poblado", // Entrance to town
//                                "Salida de poblado", // Exit of town
//                                "Área de servicio", // Service area
//                                "Parque nacional" // National park
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Orientación"
//                        ),
//                        // MARK: - 3.3.5 Confirmation Signs
//                        
//                        TrafficSign(
//                            title: "Confirmación de ciudades en itinerario de carretera convencional", // Confirmation of cities on a conventional road itinerary
//                            description: "Indica, en carreteras convencionales, los nombres de las ciudades y la distancia en kilómetros hasta ellas.", // Indicates, on conventional roads, the names of the cities and the distance to them in kilometers.
//                            images: ["S600"],
//                            wrongAnswers: [
//                                "Entrada a poblado", // Entrance to town
//                                "Hito kilométrico", // Kilometric milestone
//                                "Itinerario europeo", // European itinerary
//                                "Preseñalización de rotonda", // Roundabout pre-signing
//                                "Área de servicio", // Service area
//                                "Lugar pintoresco", // Picturesque place
//                                "Zona de acampada" // Camping area
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Orientación"
//                        ),
//                        
//                        TrafficSign(
//                            title: "Confirmación de poblaciones en itinerario de autopista o autovía", // Confirmation of towns on a motorway or highway itinerary
//                            description: "Indica, en una autopista o autovía, los nombres de las poblaciones y la distancia en kilómetros hasta ellas.", // Indicates, on a motorway or dual carriageway, the names of the towns and their distance in kilometers.
//                            images: ["S602"],
//                            wrongAnswers: [
//                                "Entrada a provincia", // Entrance to province
//                                "Hito miriamétrico", // Myriametric milestone
//                                "Entrada a comunidad autónoma", // Entrance to autonomous region
//                                "Preseñalización de servicio", // Service pre-signing
//                                "Área de descanso", // Rest area
//                                "Monumento", // Monument
//                                "Cafetería" // Coffee shop
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Orientación"
//                        ),
//                        
//                        // MARK: - 3.3.6 Specific Use in Town Signs
//                        
//                        // 1️⃣ Lugares de la red viaria urbana
//                        TrafficSign(
//                            title: "Lugares de la red viaria urbana", // Places of the urban road network
//                            description: "Indica los nombres de calles, avenidas, plazas, rotondas u otros puntos de la red viaria urbana.",
//                            // Indicates the names of streets, avenues, squares, roundabouts, or other points in the urban road network.
//                            images: ["S700"],
//                            wrongAnswers: [
//                                "Confirmación de dirección", // Direction confirmation
//                                "Itinerario alternativo", // Alternate route
//                                "Fin de vía urbana", // End of urban road
//                                "Entrada a casco histórico", // Entrance to historic center
//                                "Prioridad en intersección", // Priority at intersection
//                                "Zona de estacionamiento regulado", // Regulated parking zone
//                                "Área peatonal", // Pedestrian area
//                                "Desvío temporal" // Temporary diversion
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Orientación"
//                        ),
//                        
//                        // 2️⃣ Lugares de interés para viajeros
//                        TrafficSign(
//                            title: "Lugares de interés para viajeros", // Places of interest for travelers
//                            description: "Indica lugares de interés para los viajeros, como estaciones, aeropuertos, embarques de puertos, hoteles, campings, oficinas de turismo o clubes automovilísticos.",
//                            // Indicates places of interest for travelers such as stations, airports, port embarkations, hotels, campsites, tourist offices, and automobile clubs.
//                            images: ["S710"],
//                            wrongAnswers: [
//                                "Centro logístico", // Logistics center
//                                "Área de descanso", // Rest area
//                                "Peaje próximo", // Nearby toll
//                                "Estación de servicio", // Service station
//                                "Entrada a autopista", // Motorway entrance
//                                "Parada de emergencia", // Emergency stop
//                                "Zona de carga y descarga", // Loading/unloading zone
//                                "Itinerario principal" // Main route
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Orientación"
//                        ),
//                        
//                        // 3️⃣ Lugares de interés deportivo o recreativo
//                        TrafficSign(
//                            title: "Lugares de interés deportivo o recreativo", // Places of sporting or recreational interest
//                            description: "Indica los lugares donde predomina el interés deportivo o recreativo.",
//                            // Indicates places where sports or recreational activities are predominant.
//                            images: ["S720"],
//                            wrongAnswers: [
//                                "Parque nacional", // National park
//                                "Zona de picnic", // Picnic area
//                                "Área de descanso", // Rest area
//                                "Zona peatonal", // Pedestrian zone
//                                "Punto panorámico", // Scenic viewpoint
//                                "Ruta ecológica", // Ecological route
//                                "Camping autorizado", // Authorized camping site
//                                "Acceso restringido" // Restricted access
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Orientación"
//                        ),
//                        
//                        // 4️⃣ Lugares de carácter geográfico o ecológico
//                        TrafficSign(
//                            title: "Lugares de carácter geográfico o ecológico", // Places of geographical or ecological character
//                            description: "Indica los lugares de tipo geográfico o de interés ecológico.",
//                            // Indicates places of geographical or ecological interest.
//                            images: ["S730"],
//                            wrongAnswers: [
//                                "Reserva natural", // Nature reserve
//                                "Mirador panorámico", // Scenic viewpoint
//                                "Área de descanso", // Rest area
//                                "Estación meteorológica", // Weather station
//                                "Zona de observación de fauna", // Wildlife observation area
//                                "Camino forestal", // Forest path
//                                "Zona de riesgo por aludes", // Avalanche-prone area
//                                "Acceso a puerto de montaña" // Access to mountain pass
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Orientación"
//                        ),
//                        
//                        // 5️⃣ Lugares de interés monumental o cultural
//                        TrafficSign(
//                            title: "Lugares de interés monumental o cultural", // Places of monumental or cultural interest
//                            description: "Indica lugares de interés monumental, histórico, artístico o, en general, cultural.",
//                            // Indicates places of monumental, historical, artistic, or general cultural interest.
//                            images: ["S740"],
//                            wrongAnswers: [
//                                "Museo cerrado temporalmente", // Museum temporarily closed
//                                "Zona arqueológica protegida", // Protected archaeological zone
//                                "Monumento bajo restauración", // Monument under restoration
//                                "Ruta del vino", // Wine route
//                                "Camino de peregrinación", // Pilgrimage route
//                                "Centro de interpretación", // Visitor center
//                                "Itinerario paisajístico", // Scenic route
//                                "Área de eventos públicos" // Public events area
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Orientación"
//                        ),
//                        
//                        TrafficSign(
//                            title: "Zonas de uso industrial", // Industrial use areas
//                            description: "Indica zonas de gran atracción para camiones y, en general, para tráfico industrial pesado.", // Indicates areas of major attraction for trucks and heavy industrial traffic.
//                            images: ["S750"],
//                            wrongAnswers: [
//                                "Lugares de interés cultural", // Cultural interest places
//                                "Lugares deportivos", // Sports places
//                                "Lugares para viajeros", // Traveler interest places
//                                "Confirmación de ciudades", // City confirmation
//                                "Área de descanso", // Rest area
//                                "Zona de acampada", // Camping area
//                                "Hito kilométrico", // Kilometric milestone
//                                "Itinerario europeo" // European itinerary
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Orientación"
//                        ),
//                        
//                        TrafficSign(
//                            title: "Autopistas y autovías", // Motorways and highways
//                            description: "Indica las autopistas y autovías y los lugares a los que se puede acceder a través de ellas.", // Indicates the motorways and highways and the destinations that can be accessed through them.
//                            images: ["S760"],
//                            wrongAnswers: [
//                                "Otras carreteras y lugares", // Other places and roads
//                                "Lugares industriales", // Industrial places
//                                "Lugares culturales", // Cultural places
//                                "Confirmación de ciudades", // City confirmation
//                                "Área de descanso", // Rest area
//                                "Parque nacional", // National park
//                                "Cafetería", // Coffee shop
//                                "Zona de acampada" // Camping area
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Orientación"
//                        ),
//                        
//                        TrafficSign(
//                            title: "Otras carreteras y lugares", // Other places and roads
//                            description: "Indica las carreteras que no son autopistas ni autovías, las poblaciones a las que se puede acceder por ellas y otros lugares de interés público no incluidos en las señales S-700 a S-760.", // Indicates roads that are not motorways or highways, the towns accessible through them, and other public interest places not covered by signs S-700 to S-760.
//                            images: ["S770"],
//                            wrongAnswers: [
//                                "Autopistas y autovías", // Motorways and highways
//                                "Lugares de interés cultural", // Cultural places
//                                "Lugares industriales", // Industrial areas
//                                "Lugares de interés para viajeros", // Places for travelers
//                                "Confirmación de ciudades", // City confirmation
//                                "Entrada a provincia", // Province entrance
//                                "Área de servicio", // Service area
//                                "Parque nacional" // National park
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Señales de Orientación"
//                        ),
//                    ]
//                ),
//                TrafficSubSection(
//                    index: 4,
//                    name: "Paneles Complementarios",
//                    description: "Se colocan junto a otras señales para ampliar o aclarar su significado. Pueden indicar distancias, condiciones específicas o limitaciones temporales.",
//                    signs: [
//                        TrafficSign(
//                            title: "Distancia al inicio del peligro o prescripción",
//                            description: "Indica la distancia desde el lugar donde se encuentra la señal hasta aquel donde comienza el peligro o empieza a regir la prescripción. Si se coloca bajo una señal de estrechamiento, puede indicar el ancho libre del paso.", // Indicates the distance from where the sign is placed to where the danger or regulation begins. When placed under a narrowing sign, it may show the available width.
//                            images: ["S800"],
//                            wrongAnswers: [
//                                "Extensión de la prohibición", // Extension of the ban
//                                "Aplicación de la señal", // Sign application
//                                "Panel genérico", // Generic panel
//                                "Teléfono de emergencia", // Emergency phone
//                                "Salida de emergencia", // Emergency exit
//                                "Extintor", // Fire extinguisher
//                                "Itinerario con prioridad" // Priority route
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Paneles Complementarios"
//                        ),
//                        
//                        TrafficSign(
//                            title: "Longitud del tramo peligroso o bajo prescripción", // Length of the dangerous stretch under prescription
//                            description: "Indica la longitud a la que existe el peligro o se aplica la prescripción.", // Indicates the length over which the hazard exists or the regulation applies.
//                            images: ["S810"],
//                            wrongAnswers: [
//                                "Extensión de la prohibición", // Extension of the ban
//                                "Panel genérico", // Generic panel
//                                "Itinerario con prioridad", // Priority route
//                                "Aplicación de la señal", // Sign application
//                                "Teléfono de emergencia", // Emergency phone
//                                "Área de descanso", // Rest area
//                                "Extintor" // Fire extinguisher
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Paneles Complementarios"
//                        ),
//                        
//                        TrafficSign(
//                            title: "Extensión de la prohibición (un lado)", // Extension of the ban, on one side
//                            description: "Colocadas bajo una señal de prohibición, indican la distancia en la que dicha prohibición se aplica en la dirección de la flecha.", // Placed under a prohibition sign, they indicate the distance over which the prohibition applies in the direction of the arrow.
//                            images: ["S820", "S821"],
//                            wrongAnswers: [
//                                "Distancia al inicio del peligro", // Distance to danger
//                                "Longitud del tramo peligroso", // Length of dangerous stretch
//                                "Panel genérico", // Generic panel
//                                "Aplicación de la señal", // Sign application
//                                "Hito kilométrico", // Kilometric milestone
//                                "Itinerario con prioridad", // Priority itinerary
//                                "Teléfono de emergencia" // Emergency phone
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Paneles Complementarios"
//                        ),
//                        
//                        TrafficSign(
//                            title: "Extensión de la prohibición (ambos lados)", // Extension of the ban, on both sides
//                            description: "Colocada bajo una señal de prohibición, indica las distancias en las que la prohibición se aplica en cada dirección señalada por las flechas.", // Placed under a prohibition sign, it indicates the distances over which the prohibition applies in each direction indicated by the arrows.
//                            images: ["S830"],
//                            wrongAnswers: [
//                                "Distancia al inicio del peligro", // Distance to danger
//                                "Panel genérico", // Generic panel
//                                "Aplicación de la señal", // Sign application
//                                "Itinerario con prioridad", // Priority itinerary
//                                "Teléfono de emergencia", // Emergency phone
//                                "Salida de emergencia", // Emergency exit
//                                "Extintor" // Fire extinguisher
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Paneles Complementarios"
//                        ),
//                        
//                        TrafficSign(
//                            title: "Preseñalización de detención obligatoria", // Mandatory detention pre-marking
//                            description: "Colocada bajo la señal de ceda el paso, indica la distancia hasta la señal de stop o hasta la intersección donde debe realizarse la detención.", // Placed under the yield sign, it indicates the distance to the stop sign or the intersection where a stop must be made.
//                            images: ["S840"],
//                            wrongAnswers: [
//                                "Distancia al inicio del peligro", // Distance to danger
//                                "Longitud del tramo peligroso", // Length of hazardous section
//                                "Itinerario con prioridad", // Priority itinerary
//                                "Aplicación de la señal", // Sign application
//                                "Panel genérico", // Generic panel
//                                "Extensión de la prohibición", // Extension of prohibition
//                                "Salida de emergencia", // Emergency exit
//                                "Extintor" // Fire extinguisher
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Paneles Complementarios"
//                        ),
//                        
//                        TrafficSign(
//                            title: "Itinerario con prioridad", // Itinerary with priority
//                            description: "Como panel adicional de la señal R-3, indica el itinerario con prioridad.", // Used as an additional panel for sign R-3, it indicates the priority route.
//                            images: ["S850", "S851", "S852", "S853"],
//                            wrongAnswers: [
//                                "Preseñalización de stop", // Stop pre-signing
//                                "Extensión de la prohibición", // Extension of prohibition
//                                "Aplicación de la señal", // Sign application
//                                "Panel genérico", // Generic panel
//                                "Teléfono de emergencia", // Emergency phone
//                                "Distancia al peligro", // Distance to hazard
//                                "Salida de emergencia", // Emergency exit
//                                "Área de descanso" // Rest area
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Paneles Complementarios"
//                        ),
//                        
//                        TrafficSign(
//                            title: "Panel genérico", // Generic panel
//                            description: "Sirve para cualquier otra aclaración o delimitación de la señal o semáforo bajo el cual se coloca.", // Used for any other clarification or delimitation of the sign or traffic light it accompanies.
//                            images: ["S860a", "S860b"],
//                            wrongAnswers: [
//                                "Itinerario con prioridad", // Priority itinerary
//                                "Extensión de la prohibición", // Ban extension
//                                "Aplicación de la señal", // Sign application
//                                "Teléfono de emergencia", // Emergency phone
//                                "Salida de emergencia", // Emergency exit
//                                "Extintor", // Fire extinguisher
//                                "Panel de nieve o lluvia", // Snow or rain panel
//                                "Distancia al inicio del peligro" // Distance to hazard
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Paneles Complementarios"
//                        ),
//                        
//                        TrafficSign(
//                            title: "Aplicación de la señal", // Sign Application
//                            description: "Colocada bajo una señal de prohibición o prescripción, indica que se refiere exclusivamente al ramal de salida cuya dirección coincide con la flecha.", // Placed under a prohibition or prescription sign, it indicates that it applies only to the exit branch matching the arrow direction.
//                            images: ["S870a", "S870b"],
//                            wrongAnswers: [
//                                "Panel genérico", // Generic panel
//                                "Extensión de la prohibición", // Ban extension
//                                "Itinerario con prioridad", // Priority itinerary
//                                "Aplicación a ciertos vehículos", // Vehicles only
//                                "Panel meteorológico", // Weather panel
//                                "Teléfono de emergencia", // Emergency phone
//                                "Salida de emergencia", // Emergency exit
//                                "Extintor" // Fire extinguisher
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Paneles Complementarios"
//                        ),
//                        
//                        TrafficSign(
//                            title: "Aplicación de la señalización a ciertos vehículos", // Application of signaling to certain vehicles
//                            description: "Colocada bajo la señal vertical correspondiente, indica que la señal se refiere exclusivamente a los vehículos indicados, como camiones, vehículos con remolque, autobuses o ciclos.", // Placed under the corresponding vertical sign, it indicates that the sign applies only to the specified vehicles, such as trucks, trailers, buses, or bicycles.
//                            images: ["S880a", "S880b", "S880c", "S880d", "S880e", "S880f"],
//                            wrongAnswers: [
//                                "Aplicación de la señal", // Sign application
//                                "Panel genérico", // Generic panel
//                                "Itinerario con prioridad", // Priority itinerary
//                                "Panel meteorológico", // Weather panel
//                                "Extensión de la prohibición", // Extension of prohibition
//                                "Teléfono de emergencia", // Emergency phone
//                                "Salida de emergencia", // Emergency exit
//                                "Extintor" // Fire extinguisher
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Paneles Complementarios"
//                        ),
//                        
//                        TrafficSign(
//                            title: "Panel complementario de condiciones meteorológicas", // Complementary panel for weather conditions
//                            description: "Colocada bajo otra señal vertical, indica que esta se refiere a circunstancias como nieve, lluvia o niebla.", // Placed under another vertical sign, it indicates that it refers to conditions such as snow, rain, or fog.
//                            images: ["S890a", "S890b", "S890c"],
//                            wrongAnswers: [
//                                "Panel genérico", // Generic panel
//                                "Aplicación de la señal", // Sign application
//                                "Itinerario con prioridad", // Priority itinerary
//                                "Aplicación a ciertos vehículos", // Application to vehicles
//                                "Extensión de la prohibición", // Extension of ban
//                                "Distancia al peligro", // Distance to hazard
//                                "Extintor", // Fire extinguisher
//                                "Salida de emergencia" // Emergency exit
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Paneles Complementarios"
//                        ),
//                        TrafficSign(
//                            title: "Distancia lateral en adelantamiento a ciclista", // Lateral passing distance to cyclist
//                            description: "Recuerda a los conductores la obligación de mantener una distancia lateral mínima de 1,5 metros al adelantar a ciclistas o ciclomotores.", // Reminds drivers to keep a minimum lateral distance of 1.5 meters when overtaking cyclists or mopeds.
//                            images: ["S891"],
//                            wrongAnswers: [
//                                "Prohibido adelantar", // No overtaking
//                                "Carril bici", // Cycle lane
//                                "Fin de prohibición de adelantar", // End of overtaking prohibition
//                                "Zona escolar", // School zone
//                                "Atención ciclistas", // Caution cyclists
//                                "Uso obligatorio de luces", // Lights required
//                                "Prohibido circular en bicicleta" // No bicycles allowed
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Paneles Complementarios"
//                        ),
//                        TrafficSign(
//                            title: "Vigilancia por medios automáticos", // Surveillance by automatic means
//                            description: "Informa a los conductores de que la vía está sometida a vigilancia mediante sistemas automáticos, como cámaras o radares, para controlar el tráfico o la velocidad.", // Informs drivers that the road is under surveillance by automatic systems such as cameras or radars to monitor traffic or speed.
//                            images: ["S892"],
//                            wrongAnswers: [
//                                "Control policial", // Police control
//                                "Fin de tramo controlado", // End of controlled section
//                                "Tramo peligroso", // Dangerous section
//                                "Atención radar", // Speed camera warning
//                                "Zona escolar", // School zone
//                                "Prohibido adelantar", // No overtaking
//                                "Carril exclusivo autobuses", // Bus lane only
//                                "Uso obligatorio de cinturón" // Seatbelt required
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Paneles Complementarios"
//                        ),
//                    ]
//                ),
//                TrafficSubSection(
//                    index: 5,
//                    name: "Otras Señales",
//                    description: "Agrupa señales que no encajan en otras categorías, como avisos especiales, señalización temporal o indicaciones específicas de ciertas vías.",
//                    signs: [
//                        TrafficSign(
//                            title: "Peligro de incendio",
//                            description: "Advierte del peligro de encender fuego.", // Warns about the danger of lighting a fire.
//                            images: ["S900"],
//                            wrongAnswers: [
//                                "Extintor", // Fire extinguisher
//                                "Teléfono de emergencia", // Emergency phone
//                                "Salida de emergencia", // Emergency exit
//                                "Panel genérico", // Generic panel
//                                "Área de descanso", // Rest area
//                                "Peligro de humo", // Smoke danger
//                                "Itinerario con prioridad", // Priority itinerary
//                                "Coto de pesca" // Fishing preserve
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Otras Señales"
//                        ),
//                        TrafficSign(
//                            title: "Frecuencia de radio de información vial",
//                            description: "Indica la frecuencia a la que debe sintonizarse la radio para recibir información sobre el estado de las carreteras.", // Indicates the radio frequency to tune into for road condition information.
//                            images: ["S905"],
//                            wrongAnswers: [
//                                "Teléfono de emergencia", // Emergency phone
//                                "Extintor", // Fire extinguisher
//                                "Entrada a España", // Entry to Spain
//                                "Confirmación de país", // Country confirmation
//                                "Área de descanso", // Rest area
//                                "Velocidades en España", // Speed limits in Spain
//                                "Salida de emergencia", // Emergency exit
//                                "Panel genérico" // Generic panel
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Otras Señales"
//                        ),
//                        TrafficSign(
//                            title: "Extintor", // Fire Extinguisher
//                            description: "Indica la ubicación de un extintor de incendios.", // Indicates the location of a fire extinguisher.
//                            images: ["S910"],
//                            wrongAnswers: [
//                                "Teléfono de emergencia", // Emergency phone
//                                "Peligro de incendio", // Fire danger
//                                "Salida de emergencia", // Emergency exit
//                                "Área de descanso", // Rest area
//                                "Panel meteorológico", // Weather panel
//                                "Aplicación de señal", // Sign application
//                                "Extensión de prohibición", // Ban extension
//                                "Itinerario con prioridad" // Priority itinerary
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Otras Señales"
//                        ),
//                        
//                        TrafficSign(
//                            title: "Entrada a España", // Entry to Spain
//                            description: "Indica que se ha entrado en territorio español desde una carretera de otro país.", // Indicates entry into Spanish territory from a road of another country.
//                            images: ["S920"],
//                            wrongAnswers: [
//                                "Velocidades en España", // Speed limits in Spain
//                                "Frecuencia de radio", // Radio frequency
//                                "Teléfono de emergencia", // Emergency phone
//                                "Extintor", // Fire extinguisher
//                                "Área de descanso", // Rest area
//                                "Salida de emergencia", // Emergency exit
//                                "Panel genérico" // Generic panel
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Otras Señales"
//                        ),
//                        TrafficSign(
//                            title: "Entrada a Portugal", // Entry to Portugal
//                            description: "Indica que se ha entrado en territorio portugués desde una carretera procedente de España u otro país vecino.", // Indicates entry into Portuguese territory from a road coming from Spain or another neighboring country.
//                            images: ["S921"],
//                            wrongAnswers: [
//                                "Entrada a España", // Entry to Spain
//                                "Velocidades en Portugal", // Speed limits in Portugal
//                                "Velocidades en España", // Speed limits in Spain
//                                "Entrada a Portugal", // Entry to Portugal
//                                "Área de descanso", // Rest area
//                                "Salida de emergencia", // Emergency exit
//                                "Panel genérico" // Generic panel
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Otras Señales"
//                        ),
//                        
//                        TrafficSign(
//                            title: "Confirmación de país", // Country confirmation
//                            description: "Indica el nombre del país hacia el que se dirige la carretera. La cifra inferior señala la distancia restante hasta la frontera.", // Indicates the name of the country the road leads to, with the lower number showing the remaining distance to the border.
//                            images: ["S930a", "S930b"],
//                            wrongAnswers: [
//                                "Frecuencia de radio", // Radio frequency
//                                "Teléfono de emergencia", // Emergency phone
//                                "Área de descanso", // Rest area
//                                "Panel meteorológico", // Weather panel
//                                "Salida de emergencia", // Emergency exit
//                                "Extintor" // Fire extinguisher
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Otras Señales"
//                        ),
//                        
//                        TrafficSign(
//                            title: "Limitaciones de velocidad", // Speed limitations
//                            description: "Informa sobre las velocidades máximas según el tipo de vía en España. Se coloca al entrar en territorio español desde otro país o junto a una aduana.",
//                            // Shows maximum speed limits by road type in Spain, placed at border entries or customs points.
//                            images: ["S940"],
//                            wrongAnswers: [
//                                "Confirmación de país", // Country confirmation
//                                "Entrada a España", // Entry to Spain
//                                "Frecuencia de radio", // Radio frequency
//                                "Teléfono de emergencia", // Emergency phone
//                                "Área de descanso", // Rest area
//                                "Extintor", // Fire extinguisher
//                                "Salida de emergencia", // Emergency exit
//                                "Panel informativo genérico" // Generic information panel
//                            ],
//                            sectionName: "Señales de Indicaciones", // Information signs
//                            subSectionName: "Otras Señales" // Other signs
//                        ),
//                        TrafficSign(
//                            title: "Teléfono de emergencia", // Emergency Phone
//                            description: "Indica la ubicación de un teléfono de emergencia en la carretera.", // Indicates the location of an emergency phone along the road.
//                            images: ["S960"],
//                            wrongAnswers: [
//                                "Extintor", // Fire extinguisher
//                                "Salida de emergencia", // Emergency exit
//                                "Peligro de incendio", // Fire danger
//                                "Panel meteorológico", // Weather panel
//                                "Área de descanso", // Rest area
//                                "Frecuencia de radio", // Radio frequency
//                                "Entrada a España", // Entry to Spain
//                                "Confirmación de país" // Country confirmation
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Otras Señales"
//                        ),
//                        
//                        TrafficSign(
//                            title: "Área de parada de emergencia", // Rest Stop
//                            description: "Indica la ubicación de un apartadero con extintor y teléfono de emergencia.", // Indicates the location of a lay-by with a fire extinguisher and emergency telephone.
//                            images: ["S970"],
//                            wrongAnswers: [
//                                "Salida de emergencia", // Emergency exit
//                                "Frecuencia de radio", // Radio frequency
//                                "Velocidades en España", // Speed limits in Spain
//                                "Confirmación de país", // Country confirmation
//                                "Entrada a España", // Entry to Spain
//                                "Panel genérico" // Generic panel
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Otras Señales"
//                        ),
//                        
//                        TrafficSign(
//                            title: "Salida de emergencia", // Emergency Exit
//                            description: "Indica la ubicación de una salida de emergencia.", // Indicates the location of an emergency exit.
//                            images: ["S980", "S980a", "S980b"],
//                            wrongAnswers: [
//                                "Teléfono de emergencia", // Emergency phone
//                                "Extintor", // Fire extinguisher
//                                "Área de parada", // Rest stop
//                                "Frecuencia de radio", // Radio frequency
//                                "Velocidades en España", // Speed limits in Spain
//                                "Entrada a España", // Entry to Spain
//                                "Confirmación de país", // Country confirmation
//                                "Panel meteorológico" // Weather panel
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Otras Señales"
//                        ),
//                        
//                        TrafficSign(
//                            title: "Señal de emergencia en túneles", // Sign with arrow indicating emergency signal in tunnels
//                            description: "Indica la dirección y la distancia hasta una salida de emergencia en túneles.", // Indicates the direction and distance to an emergency exit inside tunnels.
//                            images: ["S990a", "S990b"],
//                            wrongAnswers: [
//                                "Teléfono de emergencia", // Emergency phone
//                                "Extintor", // Fire extinguisher
//                                "Área de parada", // Rest stop
//                                "Salida de emergencia", // Emergency exit
//                                "Panel genérico", // Generic panel
//                                "Peligro de incendio", // Fire danger
//                                "Frecuencia de radio", // Radio frequency
//                                "Entrada a España" // Entry to Spain
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Otras Señales"
//                        ),
//                        TrafficSign(
//                            title: "Control por medios automáticos", // Automatic monitoring or enforcement
//                            description: "Advierte a los conductores de que en la vía existen sistemas automáticos de control, como radares de velocidad, cámaras de semáforo, detección de distancia de seguridad, control de STOP o vigilancia aérea.",
//                            // Warns drivers that the road is monitored by automatic systems such as speed radars, red light cameras, safe distance sensors, STOP compliance cameras, or aerial surveillance.
//                            images: ["S991a", "S991b", "S991c", "S991d", "S991e", "S991f", "S991g"],
//                            wrongAnswers: [
//                                "Zona escolar", // School zone
//                                "Tramo de adelantamiento", // Overtaking section
//                                "Control policial temporal", // Temporary police control
//                                "Carril exclusivo para autobuses", // Bus lane only
//                                "Obras en la calzada", // Roadworks ahead
//                                "Uso obligatorio de cinturón", // Seatbelt required
//                                "Cruce con prioridad", // Priority intersection
//                                "Vigilancia manual" // Manual surveillance
//                            ],
//                            sectionName: "Señales de Indicaciones", // Information signs
//                            subSectionName: "Otras Señales" // Other signs
//                        ),
//                        TrafficSign(
//                            title: "Distancia mínima entre vehículos", // Minimum distance between vehicles
//                            description: "Informa a los conductores de la distancia mínima que deben mantener con el vehículo precedente. Puede encontrarse en carreteras convencionales, autopistas, autovías o túneles, y en algunos casos se indica mediante balizas luminosas.", // Informs drivers of the minimum distance to maintain with the vehicle ahead. It can appear on conventional roads, motorways, or tunnels, and sometimes uses luminous markers.
//                            images: ["S992a", "S992b", "S992c", "S992d", "S992e"],
//                            wrongAnswers: [
//                                "Control de separación mínima", // Minimum distance control
//                                "Control de velocidad", // Speed control
//                                "Fin de control de velocidad", // End of speed control
//                                "Vigilancia por medios automáticos", // Automatic surveillance
//                                "Zona escolar", // School zone
//                                "Carril exclusivo autobuses" // Bus lane only
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Otras Señales"
//                        ),
//                        TrafficSign(
//                            title: "Riesgo de alcances en pendiente ascendente", // Risk of rear-end collisions on uphill section
//                            description: "Advierte a los conductores del riesgo de alcances en tramos de autopista o autovía con pendiente ascendente, recordando la importancia de mantener una distancia de seguridad adecuada.", // Warns drivers of rear-end collision risk on uphill motorway sections and reminds them to maintain a safe following distance.
//                            images: ["S993"],
//                            wrongAnswers: [
//                                "Distancia mínima entre vehículos", // Minimum distance between vehicles
//                                "Control de separación mínima", // Minimum distance control
//                                "Control de velocidad", // Speed control
//                                "Pendiente ascendente", // Uphill grade
//                                "Pendiente descendente", // Downhill grade
//                                "Vigilancia por medios automáticos" // Automatic surveillance
//                            ],
//                            sectionName: "Señales de Indicaciones",
//                            subSectionName: "Otras Señales"
//                        )
//                    ]
//                )
//            ],
//        signs: []
//    )
//    
//    static let all: [TrafficSection] = [
//      advertenciaDePeligro,
//      reglamentacion,
//      indicacion
//    ]
//}
