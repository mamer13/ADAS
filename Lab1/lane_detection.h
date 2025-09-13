#ifndef LANE_DETECTION_H
#define LANE_DETECTION_H

#include <opencv2/opencv.hpp>
#include <vector>
#include <map>
#include <string>

/**
 * @brief Preprocesses an image for lane detection
 * @param image Input image (BGR or grayscale)
 * @return Preprocessed grayscale image
 * @throws std::invalid_argument if image is empty
 */
cv::Mat preprocessImage(const cv::Mat& image);

/**
 * @brief Extracts lines from an image using Hough transform
 * @param image Input image (BGR, grayscale, or float)
 * @param threshold Canny edge detection threshold
 * @return Vector of detected lines as Vec4i (x1, y1, x2, y2)
 */
std::vector<cv::Vec4i> extractLines(const cv::Mat& image, int threshold = 100);

/**
 * @brief Detects left and right lanes from extracted lines
 * @param image Input image
 * @return Map containing left_lane and right_lane vectors
 */
std::map<std::string, std::vector<cv::Vec4i>> detectLanes(const cv::Mat& image);

/**
 * @brief Filters lines based on slope criteria for lane detection
 * @param lines Vector of lines to filter
 * @return Filtered vector of lines
 */
std::vector<cv::Vec4i> filterLaneLines(const std::vector<cv::Vec4i>& lines);

/**
 * @brief Clusters similar lines into groups
 * @param lines Vector of lines to cluster
 * @return Vector of line clusters
 */
std::vector<std::vector<cv::Vec4i>> clusterLines(const std::vector<cv::Vec4i>& lines);

/**
 * @brief Validates if a line is valid for lane detection
 * @param line Line to validate
 * @return True if line is valid, false otherwise
 */
bool validateLine(const cv::Vec4i& line);

/**
 * @brief Calculates the slope of a line
 * @param line Line as Vec4i (x1, y1, x2, y2)
 * @return Slope value (infinity for vertical lines)
 */
double calculateLineSlope(const cv::Vec4i& line);

/**
 * @brief Calculates the length of a line
 * @param line Line as Vec4i (x1, y1, x2, y2)
 * @return Length of the line
 */
double calculateLineLength(const cv::Vec4i& line);

/**
 * @brief Calculates the angle of a line in degrees
 * @param line Line as Vec4i (x1, y1, x2, y2)
 * @return Angle in degrees (0-180)
 */
double calculateLineAngle(const cv::Vec4i& line);

/**
 * @brief Finds the intersection point of two lines
 * @param line1 First line
 * @param line2 Second line
 * @return Intersection point, or (-1, -1) if no intersection
 */
cv::Point2f findLineIntersection(const cv::Vec4i& line1, const cv::Vec4i& line2);

/**
 * @brief Calculates the distance between a point and a line
 * @param point Point to measure from
 * @param line Line to measure to
 * @return Distance from point to line
 */
double pointToLineDistance(const cv::Point2f& point, const cv::Vec4i& line);

/**
 * @brief Merges similar lines that are close to each other
 * @param lines Vector of lines to merge
 * @param distanceThreshold Maximum distance for merging
 * @return Vector of merged lines
 */
std::vector<cv::Vec4i> mergeSimilarLines(const std::vector<cv::Vec4i>& lines, double distanceThreshold = 10.0);

/**
 * @brief Sorts lines by their position (left to right)
 * @param lines Vector of lines to sort
 * @return Sorted vector of lines
 */
std::vector<cv::Vec4i> sortLinesByPosition(const std::vector<cv::Vec4i>& lines);

/**
 * @brief Filters lines by region of interest
 * @param lines Vector of lines to filter
 * @param roi Region of interest rectangle
 * @return Filtered vector of lines within ROI
 */
std::vector<cv::Vec4i> filterLinesByROI(const std::vector<cv::Vec4i>& lines, const cv::Rect& roi);

/**
 * @brief Calculates the average slope of a group of lines
 * @param lines Vector of lines
 * @return Average slope value
 */
double calculateAverageSlope(const std::vector<cv::Vec4i>& lines);

/**
 * @brief Finds the best fit line through a set of points
 * @param points Vector of points
 * @return Best fit line as Vec4i
 */
cv::Vec4i findBestFitLine(const std::vector<cv::Point2f>& points);

/**
 * @brief Extracts lane boundaries from detected lines
 * @param lines Vector of detected lines
 * @param imageSize Size of the input image
 * @return Vector of lane boundary lines
 */
std::vector<cv::Vec4i> extractLaneBoundaries(const std::vector<cv::Vec4i>& lines, const cv::Size& imageSize);

/**
 * @brief Calculates lane curvature from boundary lines
 * @param boundaryLines Vector of lane boundary lines
 * @return Curvature value (positive for right curves, negative for left)
 */
double calculateLaneCurvature(const std::vector<cv::Vec4i>& boundaryLines);

/**
 * @brief Estimates vehicle position relative to lane center
 * @param leftLane Left lane boundary
 * @param rightLane Right lane boundary
 * @param imageWidth Width of the image
 * @return Offset from lane center in pixels (negative = left, positive = right)
 */
double estimateLaneOffset(const std::vector<cv::Vec4i>& leftLane, 
                         const std::vector<cv::Vec4i>& rightLane, 
                         int imageWidth);

#endif // LANE_DETECTION_H


