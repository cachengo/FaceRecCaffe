import base64

import sys
import requests
import cv2


def post_image(img_file):
    """ post image and return the response """
    img = cv2.imread(img_file)
    _, img_encoded = cv2.imencode('.jpg', img)

    #with open(img_file, 'rb') as f:
    #    img = base64.b64encode(f.read())
    response = requests.post(
        'http://%s:5000/get_emb' % sys.argv[2],
        data=base64.b64encode(img_encoded)
    )
    print(response.text)


if __name__ == '__main__':
    post_image(sys.argv[1])
