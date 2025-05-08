from flask import Flask, request, jsonify # type: ignore
import tensorflow as tf
import numpy as np
from PIL import Image
import io

app = Flask(__name__)

model = tf.keras.models.load_model("FruitModel.h5")

class_names = ["Orange", "Grape"]

def preprocess_image(image_bytes):
    image = Image.open(io.BytesIO(image_bytes)).convert('RGB')
    image = image.resize((200, 200))
    image_array = np.array(image) / 255.0  
    image_array = np.expand_dims(image_array, axis=0)  
    return image_array

@app.route('/predict', methods=['POST'])
def predict():
    if 'image' not in request.files:
        return jsonify({'error': 'No image provided'}), 400

    image_file = request.files['image']
    image_bytes = image_file.read()

    try:
        input_data = preprocess_image(image_bytes)
        predictions = model.predict(input_data)[0]
        predicted_index = int(np.argmax(predictions))
        confidence = float(predictions[predicted_index])

        result = {
            'class': class_names[predicted_index],
            'confidence': round(confidence * 100, 2)
        }
        return jsonify(result)

    except Exception as e:
        return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True, host="0.0.0.0", port=5000)
# To run the app, use the command: python app.py
