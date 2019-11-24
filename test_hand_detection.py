import tensorflow as tf
import detector_utils
import cv2

detection_graph, sess = detector_utils.load_inference_graph()

img = cv2.imread('hands3.jpeg')

boxes, scores = detector_utils.detect_objects(img, detection_graph, sess)

x,y = detector_utils.get_center(2, 0.05, scores, boxes, img.shape[1], img.shape[0], img)
detector_utils.draw_box_on_image(2, 0.05, scores, boxes, img.shape[1], img.shape[0], img)
img = cv2.resize(img, (int(img.shape[1]/3),int(img.shape[0]/3)))
cv2.imshow('', img)
cv2.waitKey(0)
