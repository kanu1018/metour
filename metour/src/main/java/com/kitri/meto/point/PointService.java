package com.kitri.meto.point;

import java.util.ArrayList;

public interface PointService {
	void edit(Point p);
	void delete(int point_num);
	Point getPoint(int point_num);
	ArrayList<Point> getPointAll();
}
