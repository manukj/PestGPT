import 'package:image/image.dart' as img;
import 'package:pest_gpt/src/models/pest_detection/pest_detection_response.dart';

class ImageUtil {
  static List pestColors = [
    img.ColorRgb8(255, 0, 0),
    img.ColorRgb8(0, 255, 0),
    img.ColorRgb8(0, 0, 255),
    img.ColorRgb8(255, 0, 255),
    img.ColorRgb8(192, 192, 192),
    img.ColorRgb8(128, 128, 128),
    img.ColorRgb8(128, 0, 0),
    img.ColorRgb8(0, 255, 255),
    img.ColorRgb8(255, 255, 0),
  ];

  static img.Color getColor(int index) {
    return pestColors[index % pestColors.length];
  }

  static void drawBoundingBoxes(
      img.Image image, PestDetectionResponse response) {
    for (var detectionList in response.items) {
      for (int i = 0; i < detectionList.length; i++) {
        var item = detectionList[i];
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
        var color = getColor(i);

        img.drawString(image, item.className,
            font: img.arial14, x: (x1), y: y1, color: img.ColorRgb8(0, 0, 0));

        img.drawRect(image,
            x1: x1,
            y1: y1,
            x2: x2,
            y2: y2,
            color: color,
            thickness: 10,
            radius: 4); // Red color box
      }
    }
  }
}
