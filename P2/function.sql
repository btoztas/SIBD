DELIMITER $$

DROP FUNCTION IF EXISTS checkRegion;
CREATE FUNCTION checkRegion(Ax1 FLOAT(4,3), Ay1 FLOAT(4,3), Ax2 FLOAT(4,3), Ay2 FLOAT(4,3), Bx1 FLOAT(4,3), By1 FLOAT(4,3), Bx2 FLOAT(4,3), By2 FLOAT(4,3))
RETURNS BOOL
BEGIN
        IF Bx1>Bx2 THEN SET Bx1=Bx2+Bx1; SET Bx2 = Bx1-Bx2; SET Bx1= Bx1 - Bx2; END IF;
        IF Ax1>Ax2 THEN SET Ax1=Ax2+Ax1; SET Ax2 = Ax1-Ax2; SET Ax1= Ax1 - Ax2; END IF;
        IF By1>By2 THEN SET By1=By2+By1; SET By2 = By1-By2; SET By1= By1 - By2; END IF;
        IF Ay1>Ay2 THEN SET Ay1=Ay2+Ay1; SET Ay2 = Ay1-Bx2; SET Ay1= Ay1 - Ay2; END IF;
        IF Bx1 > Ax2 OR By1 > Ay2 OR Ax1 > Bx2 OR Ay1 > By2 THEN
                RETURN FALSE;
        ELSE
                RETURN TRUE;
        END IF;
END $$

DELIMITER ;






DELIMITER $$

DROP FUNCTION IF EXISTS regionOverlap;
CREATE FUNCTION regionOverlap(A VARCHAR(255), B VARCHAR(255))
RETURNS BOOL
BEGIN
	RETURN EXISTS (SELECT r1.series_id, r2.series_id
		   FROM region AS r1, region AS r2 WHERE checkRegion(r1.x1, r1.y1, r1.x2, r1.y2, r2.x1, r2.y1, r2.x2, r2.y2) AND r1.series_id = A AND r2.series_id = B);


END $$

DELIMITER ;
