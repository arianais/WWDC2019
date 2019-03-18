
/*:
 This file was was taken from  [Mars Habitat Price Predictor](https://developer.apple.com/documentation/coreml/integrating_a_core_ml_model_into_your_app) and was automatically generated.
 However for use with Playgrounds, the access specifiers for classes and certain members were changed from *internal* to *public*.
 
 */
import CoreML

/// Model Prediction Input Type
public class CrisisClassifierInput : MLFeatureProvider {
    
    // text of classifer
    var text: String
    
    public var featureNames: Set<String> {
        get {
            return ["text"]
        }
    }
    
    public func featureValue(for featureName: String) -> MLFeatureValue? {
        if (featureName == "text") {
            return MLFeatureValue(string: text)
        }
        return nil
    }
    
    public init(text: String) {
        self.text = text
    }
}


/// Model Prediction Output Type
public class CrisisClassifierOutput : MLFeatureProvider {
    
    ///label of crisis classification
    public let label: String
    
    public var featureNames: Set<String> {
        get {
            return ["label"]
        }
    }
    
    public func featureValue(for featureName: String) -> MLFeatureValue? {
        if (featureName == "label") {
            return MLFeatureValue(string: label)
        }
        return nil
    }
    
    init(label: String) {
        self.label = label
    }
}


// Class for model loading and prediction
public class CrisisClassifier {
    var model: MLModel
    
    /**
     Construct a model with explicit path to mlmodel file
     - parameters:
     - url: the file url of the model
     - throws: an NSError object that describes the problem
     */
    public init(contentsOf url: URL) throws {
        self.model = try MLModel(contentsOf: url)
    }
    
    // Construct a model that automatically loads the model from the app's bundle
    public convenience init() {
        let bundle = Bundle(for: CrisisClassifier.self)
        let assetPath = bundle.url(forResource: "CrisisClassifier", withExtension:"mlmodelc")
        try! self.init(contentsOf: assetPath!)
    }
    
    /**
     Make a prediction using the structured interface
     - parameters:
     - input: the input to the prediction as CrisisClassifierInput
     - throws: an NSError object that describes the problem
     - returns: the result of the prediction as CrisisClassifierOutput
     */
    public func prediction(input: CrisisClassifierInput) throws -> CrisisClassifierOutput {
        let outFeatures = try model.prediction(from: input)
        let result = CrisisClassifierOutput(label: outFeatures.featureValue(for: "label")!.stringValue)
        return result
    }
    
    /**
     Make a prediction using the convenience interface
     - parameters:
     - solarPanels: Number of solar panels as double value
     - greenhouses: Number of greenhouses as double value
     - size: Size in acres as double value
     - throws: an NSError object that describes the problem
     - returns: the result of the prediction as CrisisClassifierOutput
     */
    public func prediction(text: String) throws -> CrisisClassifierOutput {
        let input_ = CrisisClassifierInput(text: text)
        return try self.prediction(input: input_)
    }
}
