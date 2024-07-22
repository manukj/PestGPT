import 'package:image/image.dart' as img;
import 'package:pest_gpt/src/models/pest_detection/pest_detection_response.dart';

class ImageUtil {
  static void drawBoundingBoxes(
      img.Image image, PestDetectionResponse response) {
    for (var detectionList in response.items) {
      for (var item in detectionList) {
        List<double> box = item.box;
        List<int> originalShape = item.originalShape;

        // Scale factors
        double xScale = image.width / originalShape[1];
        double yScale = image.height / originalShape[0];

        // Scale coordinates
        int x1 = (box[0] * xScale).toInt();
        int y1 = (box[1] * yScale).toInt();
        int x2 = (box[2] * xScale).toInt();
        int y2 = (box[3] * yScale).toInt();
        // Draw the bounding box
        drawRect(
            image, x1, y1, x2, y2, img.ColorRgb8(255, 0, 0)); // Red color box
      }
    }
  }

  static void drawRect(
      img.Image image, int x1, int y1, int x2, int y2, img.Color color) {
    for (int x = x1; x <= x2; x++) {
      image.setPixel(x, y1, color);
      image.setPixel(x, y2, color);
    }
    for (int y = y1; y <= y2; y++) {
      image.setPixel(x1, y, color);
      image.setPixel(x2, y, color);
    }
  }
}
