package com.kitri.meto.point;

import java.util.ArrayList;

public interface PointMapper {
	void update(Point p);
	void delete(int point_num);
	Point select(int point_num);
	ArrayList<Point> selectAll();
}
