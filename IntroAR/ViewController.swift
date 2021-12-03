//
//  ViewController.swift
//  IntroAR
//
//  Created by soham gupta on 12/2/21.
//

import UIKit
import RealityKit

class ViewController: UIViewController {
    
    @IBOutlet var arView: ARView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let anchor = AnchorEntity(plane: .horizontal, minimumBounds: [0.2, 0.7])
        
        arView.scene.addAnchor(anchor)
        
        let box = MeshResource.generateText("Soham Gupta",
                                            extrusionDepth: 0.05,
                                                      font: .systemFont(ofSize: 0.15),
                                            containerFrame: CGRect.zero,
                                                 alignment: .center,
                                             lineBreakMode: .byCharWrapping)
        
        let metalMaterial = SimpleMaterial(color:.red, isMetallic: true)
        
        let model = ModelEntity(mesh:box, materials: [metalMaterial])
        
        model.generateCollisionShapes(recursive: true)
        
        model.position = [0, 0, 0]
        anchor.addChild(model)
    }
}
