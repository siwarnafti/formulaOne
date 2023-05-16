import ARKit
import RealityKit
import SwiftUI
import FocusEntity

struct RealityKitView: UIViewRepresentable {
    let carname:String
    func makeUIView(context: Context) -> ARView {
        let view = ARView()
        // Start AR session
        let session = view.session
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal]
        session.run(config)
        
        // Add coaching overlay
        let coachingOverlay = ARCoachingOverlayView()
        coachingOverlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        coachingOverlay.session = session
        coachingOverlay.goal = .horizontalPlane
        view.addSubview(coachingOverlay)
//        view.enableObjectRemoval()
       
       

        // Handle ARSession events via delegate
        context.coordinator.view = view
        session.delegate = context.coordinator
        
        // Handle taps
        view.addGestureRecognizer(
            UITapGestureRecognizer(
                target: context.coordinator,
                action: #selector(Coordinator.handleTap(_:))
            )
        )
//        let longPressGestureRecognizer = UILongPressGestureRecognizer(target: view, action: #selector(Coordinator.handleLongPress(recognizer:)))
//        view.addGestureRecognizer(UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handleLongPress(_:) ) ))
        return view
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(carname:carname)
    }
    
    func updateUIView(_ view: ARView, context: Context) {
        // No need to update the view in this example
       
    }
    class MyEntity: Entity, HasAnchoring, HasModel, HasCollision {

    }
    
    class Coordinator: NSObject, ARSessionDelegate {
        var carname:String
        weak var view: ARView?
        var focusEntity: FocusEntity?
        var selectedEntity: Entity?
        let anchor = AnchorEntity()
        init(carname: String) {
                self.carname = carname
            }
        
        func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
            guard let view = self.view else { return }
            debugPrint("Anchors added to the scene: ", anchors)
            self.focusEntity = FocusEntity(on: view, style: .classic(color: .yellow))
        }
        
        @objc func handleTap(_ gesture: UITapGestureRecognizer) {
            guard let view = self.view, let focusEntity = self.focusEntity else { return }
            
            // Create a new anchor to add content to
            let anchor = MyEntity()
            if selectedEntity == nil {
//                view.scene.anchors.append(anchor)
                
                // Add a Formula entity
                let formula = try! ModelEntity.load(named: carname)
                formula.scale = [0.5, 0.5, 0.5]
                formula.position = focusEntity.position
                formula.name="ferrari"
                anchor.addChild(formula)
                view.scene.addAnchor(anchor)
//                let entity = formula as? Entity & HasCollision
//                arView.installGestures([.all], for: entity!)
//                adding gestures to model
                formula.generateCollisionShapes(recursive: true)
                view.installGestures([.translation,.rotation,.scale],for: anchor)
//                view.enableObjectRemoval()
                selectedEntity = formula
//
            }
            
            
        }
        @objc func handleLongPress(_ recognizer: UILongPressGestureRecognizer){
            let location = recognizer.location(in: view)
            if let entity = view?.entity(at: location){
                if let anchorEntity = entity.anchor, anchorEntity.name == "ferrari"{
                    anchorEntity.removeFromParent()
                    print("anchor removed")
                }
            }
        }
        func enableGestureRemoval(){
            
        }
        
        
        
    }
    
}

