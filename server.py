import base64
import io
from PIL import Image

import matplotlib
import numpy as np
from flask import Flask, request, jsonify

from face_features import FaceFeatureExtractor

matplotlib.use("Pdf")
app = Flask(__name__)


feature_extractor = FaceFeatureExtractor()


@app.route('/get_emb', methods=['POST'])
def get_emb():
    img_data = np.array(
        Image.open(
            io.BytesIO(
                base64.b64decode(request.data)
            )
        )
    )
    embs, times = feature_extractor.getFeatures(img_data)
    return jsonify({'embs': embs.tolist(), 'times': times})


if __name__ == "__main__":
    app.run(debug=True, port=5000, host='0.0.0.0')
