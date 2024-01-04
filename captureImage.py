import cv2

def capture_image():
    cam = cv2.VideoCapture(0)

    ret, frame = cam.read()
    if not ret:
        print("Failed to grab frame")
        return

    img_name = "opencv_frame.png"
    cv2.imwrite(img_name, frame)

    cam.release()

capture_image()