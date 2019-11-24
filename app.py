from flask import Flask
from flask import request
from flask import jsonify
app = Flask(__name__)

subscription_key = '78bf8ba1b7cf4661bf2df6c714011119'
endpoint = 'https://westeurope.api.cognitive.microsoft.com/'

from azure.cognitiveservices.vision.computervision import ComputerVisionClient
from msrest.authentication import CognitiveServicesCredentials

import time

from PIL import Image
import requests
from io import BytesIO
# import cv2
import detector_util
import numpy as np
import math

camera_ip = "131.159.220.72"
camera_port = "8080"


computervision_client = ComputerVisionClient(endpoint, CognitiveServicesCredentials(subscription_key))
print(computervision_client)

@app.route("/")
def hello():
    return "Hello World!"

@app.route("/camera", methods=["POST"])
def track_camera():
    global camera_ip
    camera_ip = request.form['username']
    return "connected"

@app.route("/classify/", methods=["GET"])
def classify_object():

    remote_image_url = "http://131.159.220.72:8080/shot.jpg"
  #  remote_image_url = "https://arbordayblog.org/wp-content/uploads/2018/06/oak-tree-sunset-iStock-477164218-1080x608.jpg"
    print("===== Detect Objects - remote =====")
#    response = requests.get(remote_image_url)
#    img = Image.open(BytesIO(response.content))
 #   img.show()
  #  time.sleep(5)
   # img.close()

    response = requests.get(remote_image_url)
    img = Image.open(BytesIO(response.content))
    img = np.array(img)
    h = img.shape[0] / 2
    w = img.shape[1] / 2
    center = h,w


    boxes, scores = detector_utils.detect_hands(img, detection_graph, sess)
    
    x, y = detector_utils.get_center(2, 0.05, scores, boxes, img.shape[1], img.shape[0], img)
    if x != 0 and y != 0:
        h = y
        w = x

    # Get URL image with different objects
    # Call API with URLzu
    detect_objects_results_remote = computervision_client.detect_objects(remote_image_url)


    all_objects = ""
    # Print detected objects results with bounding boxes
    print("Detecting objects in remote image:")

    best_result = 'No object'
    min_center_distance = float('inf')
    for object in detect_objects_results_remote.objects:
        center_x = object.rectangle.x + object.rectangle.w / 2
        center_y = object.rectangle.y + object.rectangle.h / 2
        dist = calculateDistance(w,h, center_x, center_y)
        center_distance = calculateDistance(w,h,center_x,center_y)
        if center_distance < min_center_distance:
            min_center_distance = center_distance
            best_result = object.object_property

        # print("object at location {}, {}, {}, {}".format( \
        #     object.rectangle.x, object.rectangle.x + object.rectangle.w, \
        #     object.rectangle.y, object.rectangle.y + object.rectangle.h))
        # print(object.object_property)
        # return jsonify(object.object_property)

    # return jsonify("No object")
#    print('best', best_result)
    return jsonify(best_result)


def calculateDistance(x1,y1,x2,y2):
    dist = math.sqrt((x2 - x1)**2 + (y2 - y1)**2)
    return dist
