//
//  SceneDelegate.swift
//  RickAndMorty
//
//  Created by Alexander Shchavrovskiy on 22.04.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let model = CharacterViewController.Model(
            statusModel: .init(key: "Some", value: "Value"),
            name: "Rick",
            imageURL: URL(string: "https://rickandmortyapi.com/api/character/avatar/2.jpeg")!
        )
        let navigationController = UINavigationController(rootViewController: CharacterViewController(model: model))
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        self.window = window
    }

    func sceneDidDisconnect(_ scene: UIScene) {}

    func sceneDidBecomeActive(_ scene: UIScene) {}

    func sceneWillResignActive(_ scene: UIScene) {}

    func sceneWillEnterForeground(_ scene: UIScene) {}

    func sceneDidEnterBackground(_ scene: UIScene) {}
}

