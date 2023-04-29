//
//  File.swift
//  News
//
//  Created by MacBook Pro 13 2019 on 4/29/23.
//

import UIKit

struct News {
    let title: String
    let imageNews: UIImage
    let description: String
    
    static func getNews() -> [News] {
        return [
            News(
                title: "Tesla Unveils New Electric Car Model",
                imageNews: UIImage(named: "image") ?? UIImage.actions,
                description: "Tesla has unveiled its latest electric car model, which promises to be the most powerful and efficient yet. The car features a range of new technologies, including an advanced battery system that can be charged in just a few minutes. With a top speed of 250 mph and a range of over 500 miles, the new Tesla is set to revolutionize the electric car market."
            ),
            News(
                title: "AI Researchers Develop New Algorithm",
                imageNews: UIImage(named: "image") ?? UIImage.actions,
                description: "Researchers at MIT have developed a new machine learning algorithm that they claim is the most accurate yet. The algorithm, which is based on a neural network architecture, has been trained on a vast dataset of images and has achieved a classification accuracy of over 99%. The researchers believe that their algorithm could have applications in a wide range of fields, from healthcare to self-driving cars."
            ),
            News(
                title: "SpaceX Launches New Mission to Mars",
                imageNews: UIImage(named: "image") ?? UIImage.actions,
                description: "SpaceX has successfully launched a new mission to Mars, with the aim of establishing a permanent human settlement on the planet within the next decade. The mission, which is being funded by a consortium of private investors, will involve a series of unmanned probes and robotic landers, followed by manned missions in the coming years. The ultimate goal is to establish a self-sustaining colony on Mars that can support human life indefinitely."
            ),
            News(
                title: "Scientists Discover New Species in Amazon Rainforest",
                imageNews: UIImage(named: "image") ?? UIImage.actions,
                description: "A team of scientists working in the Amazon rainforest have discovered a new species of monkey. The monkey, which has been named after the scientist who led the expedition, has distinctive markings and is thought to be closely related to other monkey species found in the region. The discovery has sparked new interest in the biodiversity of the Amazon rainforest and the need to protect it from deforestation and other threats."
            ),
            News(
                title: "New Study Reveals Health Benefits of Mediterranean Diet",
                imageNews: UIImage(named: "image") ?? UIImage.actions,
                description: "A new study has revealed that following a Mediterranean diet can have significant health benefits, including a reduced risk of heart disease, stroke, and other chronic conditions. The diet, which is rich in fruits, vegetables, whole grains, and lean protein, has been shown to have a positive impact on overall health and well-being. The study has been welcomed by health experts, who believe that it could help to reduce the burden of chronic disease on healthcare systems around the world."
            ),
        ]
    }

}
