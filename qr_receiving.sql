create database qr_receiving

	
############	TABLE	#################

CREATE TABLE PDC_RECEIVE_PART_TODAY (
    PART_NO VARCHAR(15) NULL,
    VENDOR VARCHAR(10) NULL,
    QTY_PLAN DECIMAL(38, 0) NULL,
    LOCATION VARCHAR(10) NULL,
    DELIVERY_KEY VARCHAR(15) NOT NULL,
    ACT_QTY DECIMAL(38, 0) NULL,
    DIFFER_QTY DECIMAL(38, 0) NULL,
    UNLOADING DATE NULL,
    TIME_RECEIVE DATE NULL,
    USER_RECEIVE VARCHAR(10) NULL,
    REASON VARCHAR(100) NULL,
    REMARK VARCHAR(50) NULL,
    TIME_LATE DATE NULL,
    USER_UNLOADING VARCHAR(20) NULL,
    LEADER_CONFIRM VARCHAR(20) NULL,
    TIME_CONFIRM DATE NULL,
    DATE_DELIVERY VARCHAR(20) NULL,
    TIME_DELIVERY VARCHAR(20) NULL,
    STATUS VARCHAR(1) NULL,
    FLAG VARCHAR(5) NULL,
    SUBFIX_ACTUAL VARCHAR(5) NULL,
    SUBFIX_PLAN VARCHAR(5) NULL,
    DT_ENTRY DATE NULL,
    PO_STATUS VARCHAR(5) NULL,
    TIME_RED DATE NULL,
    COLOR_STATUS VARCHAR(2) NULL,
    INSPECTION VARCHAR(20) NULL,
    NG_QTY DECIMAL(38, 0) NULL,
    INS_REVISE_FLAG DECIMAL(38, 0) NULL,
    ECN VARCHAR(20) NULL,
    NO_DRAW VARCHAR(20) NULL,
    INVOICE_NO VARCHAR(20) NULL,
    BOX_QTY DECIMAL(38, 0) NULL,
    UNIT_QTY DECIMAL(38, 0) NULL,
    BOX_CODE VARCHAR(50) NULL,
    UNIT_BOX VARCHAR(50) NULL,
    ID_TH_MOLD DECIMAL(38, 0) NULL,
    NO_DS VARCHAR(2) NULL,
    PUC_USER_CONFIRM VARCHAR(10) NULL,
    PUC_DATE_CONFIRM DATE NULL,
    LATE_INPUT DECIMAL(38, 0) NULL,
    GATE VARCHAR(10) NULL,
    INS VARCHAR(20) NULL,
    MH_CONFIRM VARCHAR(200) NULL,
    SOLUTION VARCHAR(200) NULL,
    APPROVE VARCHAR(20) NULL,
    PUR_CONFIRM VARCHAR(200) NULL,
    PUR_SOLUTION VARCHAR(200) NULL,
    PUR_APPROVE VARCHAR(20) NULL,
    PUR_CLOSE VARCHAR(20) NULL,
    LOG_CONFIRM VARCHAR(200) NULL,
    LOG_SOLUTION VARCHAR(200) NULL,
    LOG_APPROVE VARCHAR(20) NULL,
    LOG_CLOSE VARCHAR(20) NULL,
    PUR_ATTACK VARCHAR(100) NULL,
    USER_CHECK VARCHAR(20) NULL,
    PDC2_CHECK VARCHAR(100) NULL,
    STATUS_CHECK VARCHAR(100) NULL,
    FINAL_DEPT VARCHAR(100) NULL,
    STATUS_REC VARCHAR(10) NULL,
    STATUS_MH VARCHAR(10) NULL,
    STATUS_PUR VARCHAR(10) NULL,
    STATUS_LOG VARCHAR(10) NULL,
    USER_MH_CONFIRM VARCHAR(10) NULL,
    USER_PUR_CONFIRM VARCHAR(10) NULL,
    USER_LOG_CONFIRM VARCHAR(10) NULL,
    RESPONSIBILITY VARCHAR(20) NULL,
    TIME_MH_CONFIRM DATE NULL,
    TIME_PUR_CONFIRM DATE NULL,
    TIME_LOG_CONFIRM DATE NULL,
    MH_CLOSE VARCHAR(20) NULL,
    FINISH_TIME DATE NULL,
    SYNTHETIC_STATUS VARCHAR(20) NULL,
    TOTAL_TIME DECIMAL(38, 0) NULL,
    CD_DESTIN VARCHAR(4) NULL,
    RP_NO DECIMAL(38, 0) NULL,
    TRUCK_SIZE VARCHAR(20) NULL,
    DATE_ENTRY DATE NULL,
    USER_ENTRY VARCHAR(20) NULL,
    DATE_UPDATE DATE NULL,
    USER_UPDATE VARCHAR(20) NULL,
    DATE_UPDATE_INPUT DATE NULL,
    USER_UPDATE_INPUT VARCHAR(20) NULL,
    PRIMARY KEY (DELIVERY_KEY)
);


CREATE TABLE QR_USER (
    USER_ID VARCHAR(10) NOT NULL,
    USER_FULL_NAME VARCHAR(50) NOT NULL,
    USER_GRADE INT NOT NULL,
    USER_PASSWORD VARCHAR(50) NOT NULL,
    PRIMARY KEY (USER_ID)
);


CREATE TABLE QR_VENDOR (
    VENDOR VARCHAR(255) NOT NULL,
    APPLY_STATUS INT NOT NULL,
    VENDOR_NAME VARCHAR(255) NULL,
    VENDOR_ADDRESS TEXT NULL,
    PRIMARY KEY (VENDOR)
);


CREATE TABLE QR_PART_INFOR (
    VENDOR VARCHAR(255) NOT NULL,
    PART_NO VARCHAR(255) NOT NULL,
    PART_NUMBER VARCHAR(255) NOT NULL,
    BOX_CODE VARCHAR(255) NULL,
    KIT_QTY INT NULL,
    TRAY_QTY INT NULL,
    REMARK VARCHAR(255) NULL,
    SNP INT NULL,
    PRIMARY KEY (PART_NUMBER),
    FOREIGN KEY (VENDOR) REFERENCES QR_VENDOR(VENDOR)
);


CREATE TABLE QR_CART_DIRECT (
    Vendor VARCHAR(255) NULL,
    Cart_no VARCHAR(255) NOT NULL,
    Current_status VARCHAR(255) NULL,
    Current_port VARCHAR(255) NULL,
    Last_date VARCHAR(255) NULL,
    Last_time VARCHAR(255) NULL,
    Real_time VARCHAR(50) NULL,
    PRIMARY KEY (Cart_no),
    FOREIGN KEY (VENDOR) REFERENCES QR_VENDOR(VENDOR)
);



CREATE TABLE QR_BOX_CODE_PREPARE (
    BOX_CODE VARCHAR(450) NOT NULL,
    loadingStatus VARCHAR(255) NULL,
    loadingCart VARCHAR(255) NULL,
    returnDate VARCHAR(255) NULL,
    returnTime VARCHAR(255) NULL,
    returnLoc VARCHAR(255) NULL,
    returnLot VARCHAR(255) NULL,
    qty INT NULL,
    vendor VARCHAR(255) NULL,
    partNo VARCHAR(255) NULL,
    employeeCode VARCHAR(20) NULL,
    partNumber VARCHAR(255) NULL,
    PRIMARY KEY (BOX_CODE),
    FOREIGN KEY (vendor) REFERENCES QR_VENDOR(VENDOR),
    FOREIGN KEY (loadingCart) REFERENCES QR_CART_DIRECT(Cart_no),
    FOREIGN KEY (partNumber) REFERENCES QR_PART_INFOR(PART_NUMBER),
    FOREIGN KEY (BOX_CODE) REFERENCES QR_HISTORY_CASEMARK(qrValue)
);


CREATE TABLE QR_BOX_SHIKYU (
    Vendor VARCHAR(255) NULL,
    Box_no VARCHAR(255) NOT NULL,
    Current_status VARCHAR(255) NULL,
    Current_port VARCHAR(255) NULL,
    Last_date VARCHAR(255) NULL,
    Last_time VARCHAR(255) NULL,
    Last_cart VARCHAR(255) NULL,
    Real_time VARCHAR(50) NULL,
    PRIMARY KEY (Box_no),
    FOREIGN KEY (vendor) REFERENCES QR_VENDOR(VENDOR),
    FOREIGN KEY (Last_cart) REFERENCES QR_CART_DIRECT(Cart_no)
);


CREATE TABLE QR_SHIKYU_PLAN (
    VENDOR VARCHAR(50) NOT NULL,
    TIME_DELIVERY VARCHAR(10) NOT NULL,
    VENDOR_LOT VARCHAR(50) NOT NULL,
    PRIMARY KEY (VENDOR_LOT),
    FOREIGN KEY (VENDOR) REFERENCES QR_VENDOR(VENDOR)
);


CREATE TABLE QR_TROUBLE_RECEIVING (
    ERROR_CODE VARCHAR(255) NULL,
    ERROR_TYPE VARCHAR(255) NULL,
    ERROR_REMARK VARCHAR(255) NULL,
    TROUBLE_KEY VARCHAR(450) NOT NULL,
    vendor VARCHAR(10) NULL,
    receivedDate VARCHAR(255) NULL,
    receivedLoc VARCHAR(255) NULL,
    receivedLot VARCHAR(255) NULL,
    PRIMARY KEY (TROUBLE_KEY),
    FOREIGN KEY (vendor) REFERENCES QR_VENDOR(VENDOR)
);


CREATE TABLE QR_RECEIVING_UNLOADING (
    VENDOR VARCHAR(4) NULL,
    LOCATION VARCHAR(4) NULL,
    DATE_DELIVERY VARCHAR(8) NULL,
    TIME_DELIVERY VARCHAR(4) NULL,
    LOT_KEY VARCHAR(20) NOT NULL,
    PRIMARY KEY (LOT_KEY),
    FOREIGN KEY (VENDOR) REFERENCES QR_VENDOR(VENDOR)
);


CREATE TABLE QR_HISTORY_BOX_SHIKYU (
    VENDOR_NO VARCHAR(255) NOT NULL,
    BOX_NO VARCHAR(255) NOT NULL,
    BOX_STATUS VARCHAR(255) NULL,
    BOX_LOC VARCHAR(255) NULL,
    BOX_DATE VARCHAR(255) NULL,
    BOX_TIME VARCHAR(255) NULL,
    BOX_LOT VARCHAR(255) NULL,
    FOREIGN KEY (VENDOR_NO) REFERENCES QR_VENDOR(VENDOR),
	FOREIGN KEY (BOX_NO) REFERENCES QR_BOX_SHIKYU(Box_no)
);


CREATE TABLE QR_HISTORY_CART_DIRECT (
    VENDOR_NO VARCHAR(255) NOT NULL,
    CART_NO VARCHAR(255) NOT NULL,
    CART_STATUS VARCHAR(255) NOT NULL,
    CART_LOC VARCHAR(255) NOT NULL,
    CART_DATE VARCHAR(255) NULL,
    CART_TIME VARCHAR(255) NULL,
    CART_LOT VARCHAR(255) NULL,
    FOREIGN KEY (VENDOR_NO) REFERENCES QR_VENDOR(VENDOR),
    FOREIGN KEY (CART_NO) REFERENCES QR_CART_DIRECT(Cart_no)
);


CREATE TABLE QR_HISTORY_DELIVERY_PLAN (
    PART_NO VARCHAR(255) NULL,
    VENDOR VARCHAR(10) NULL,
    QTY_PLAN DECIMAL(38, 0) NULL,
    LOCATION VARCHAR(255) NULL,
    DELIVERY_KEY VARCHAR(255) NOT NULL,
    DATE_DELIVERY VARCHAR(255) NULL,
    TIME_DELIVERY VARCHAR(255) NULL,
    STATUS VARCHAR(255) NULL,
    PO_STATUS VARCHAR(255) NULL,
    ACTUAL_QTY INT NULL,
    SHIPPING_QTY INT NULL,
    VENDOR_LOT VARCHAR(255) NULL,
    PROBLEM INT NULL,
    DS_SUBFIX VARCHAR(10) NULL,
    DS_KEY VARCHAR(50) NULL,
    SUBFIX_PLAN VARCHAR(10) NULL,
    INS_ACTUAL VARCHAR(10) NULL,
    INS VARCHAR(10) NULL,
    LEADER_REMARK TEXT NULL,
    LEADER_CONFIRM VARCHAR(10) NULL,
    NUMBER_BOX_SCAN INT NULL,
    NUMBER_BOX_MANUAL INT NULL,
    PART_NUMBER VARCHAR(255) NULL,
    PRIMARY KEY (DELIVERY_KEY),
    FOREIGN KEY (VENDOR) REFERENCES QR_VENDOR(VENDOR),
    FOREIGN KEY (DELIVERY_KEY) REFERENCES PDC_RECEIVE_PART_TODAY(DELIVERY_KEY),
    FOREIGN KEY (PART_NUMBER) REFERENCES QR_PART_INFOR(PART_NUMBER)
);


CREATE TABLE QR_HISTORY_CASEMARK (
    partNo VARCHAR(255) NULL,
    dieLine VARCHAR(255) NULL,
    vendor VARCHAR(255) NULL,
    lot VARCHAR(255) NULL,
    boxNumber VARCHAR(255) NULL,
    boxQty INT NULL,
    shift VARCHAR(255) NULL,
    hisRev VARCHAR(255) NULL,
    cavity VARCHAR(255) NULL,
    remark VARCHAR(255) NULL,
    codeTransfer VARCHAR(255) NULL,
    receivedDate VARCHAR(255) NULL,
    receivedTime VARCHAR(255) NULL,
    receivedLoc VARCHAR(255) NULL,
    receivedLot VARCHAR(255) NULL,
    employeeCode VARCHAR(255) NULL,
    shiftName VARCHAR(255) NULL,
    shiftDate VARCHAR(255) NULL,
    qrValue VARCHAR(450) NOT NULL,
    movingBCFrom VARCHAR(255) NULL,
    movingBCTo VARCHAR(255) NULL,
    partNumber VARCHAR(255) NULL,
    PRIMARY KEY (qrValue),
    FOREIGN KEY (vendor) REFERENCES QR_VENDOR(VENDOR),
    FOREIGN KEY (partNumber) REFERENCES QR_PART_INFOR(PART_NUMBER)
);


CREATE TABLE InventoryMovingHistory (
    movingDate VARCHAR(255) NOT NULL,
    movingTime VARCHAR(255) NOT NULL,
    partNumber VARCHAR(255) NOT NULL,
    inOutCode VARCHAR(255) NOT NULL,
    movingQty INT NOT NULL,
    movingBCFrom VARCHAR(255) NOT NULL,
    inventoryAtFrom INT NOT NULL,
    movingBCTo VARCHAR(255) NOT NULL,
    inventoryAtTo INT NOT NULL,
    employeeCode VARCHAR(255) NOT NULL,
    movingCode VARCHAR(255) NOT NULL,
    shiftName VARCHAR(255) NOT NULL,
    shiftDate VARCHAR(255) NOT NULL,
     PRIMARY KEY (movingCode),
    FOREIGN KEY (partNumber) REFERENCES QR_PART_INFOR(PART_NUMBER)
);


CREATE TABLE InventoryUpdateQty (
    partNumber VARCHAR(255) NOT NULL,
    REC_B INT NOT NULL,
    REC_C INT NOT NULL,
    REC_D INT NOT NULL,
    REC_F INT NOT NULL,
    STORE_B INT NOT NULL,
    STORE_C INT NOT NULL,
    STORE_D INT NOT NULL,
    STORE_F INT NOT NULL,
    LPS_1ST INT NOT NULL,
    LPS_2ND INT NOT NULL,
    SPECIAL_1ST INT NOT NULL,
    SPECIAL_2ND INT NOT NULL,
    ASSY_1 INT NOT NULL,
    ASSY_2 INT NOT NULL,
    ASSY_3 INT NOT NULL,
    ASSY_4 INT NOT NULL,
    totalQty INT GENERATED ALWAYS AS 
    (REC_B + REC_C + REC_D + REC_F + STORE_B + STORE_C + STORE_D + STORE_F + LPS_1ST + LPS_2ND + SPECIAL_1ST + SPECIAL_2ND + ASSY_1 + ASSY_2 + ASSY_3 + ASSY_4) 
    STORED,
    MOLD_STORE INT NULL,
    PRIMARY KEY (partNumber),
    FOREIGN KEY (partNumber) REFERENCES QR_PART_INFOR(PART_NUMBER)
);



#########################	VIEW	################################
CREATE VIEW IT_VIEW_RECEIVING_HISTORY AS
SELECT
    PART_NO,
    VENDOR,
    QTY_PLAN,
    LOCATION,
    DELIVERY_KEY,
    DATE_DELIVERY,
    TIME_DELIVERY,
    STATUS,
    PO_STATUS,
    ACTUAL_QTY,
    DS_SUBFIX,
    SUBFIX_PLAN,
    INS_ACTUAL,
    INS,
    LEADER_REMARK,
    LEADER_CONFIRM,
    DS_KEY
FROM
    QR_HISTORY_DELIVERY_PLAN
WHERE
    PO_STATUS = 'IV'
    AND DATE_DELIVERY = REPLACE(CAST(NOW() AS CHAR(10)), '/', '')
    AND TIME_DELIVERY > '0710'
    AND TIME_DELIVERY <= '2010'
    AND TIME(NOW()) > '07:10:00'
    AND TIME(NOW()) <= '20:10:00'
UNION ALL
SELECT
    PART_NO,
    VENDOR,
    QTY_PLAN,
    LOCATION,
    DELIVERY_KEY,
    DATE_DELIVERY,
    TIME_DELIVERY,
    STATUS,
    PO_STATUS,
    ACTUAL_QTY,
    DS_SUBFIX,
    SUBFIX_PLAN,
    INS_ACTUAL,
    INS,
    LEADER_REMARK,
    LEADER_CONFIRM,
    DS_KEY
FROM
    QR_HISTORY_DELIVERY_PLAN
WHERE
    PO_STATUS = 'IV'
    AND DATE_DELIVERY = REPLACE(CAST(NOW() AS CHAR(10)), '/', '')
    AND TIME_DELIVERY > '2010'
    AND TIME(NOW()) > '20:10:00'
UNION ALL
SELECT
    PART_NO,
    VENDOR,
    QTY_PLAN,
    LOCATION,
    DELIVERY_KEY,
    DATE_DELIVERY,
    TIME_DELIVERY,
    STATUS,
    PO_STATUS,
    ACTUAL_QTY,
    DS_SUBFIX,
    SUBFIX_PLAN,
    INS_ACTUAL,
    INS,
    LEADER_REMARK,
    LEADER_CONFIRM,
    DS_KEY
FROM
    QR_HISTORY_DELIVERY_PLAN
WHERE
    (
        (
            PO_STATUS = 'IV'
            AND DATE_DELIVERY = REPLACE(CAST((NOW() - INTERVAL 1 DAY) AS CHAR(10)), '/', '')
            AND TIME_DELIVERY > '2010'
        )
        OR (
            PO_STATUS = 'IV'
            AND DATE_DELIVERY = REPLACE(CAST(NOW() AS CHAR(10)), '/', '')
            AND TIME_DELIVERY <= '0710'
        )
    )
    AND TIME(NOW()) <= '07:10:00';
    
  CREATE VIEW QR_SUM_BOX_RECEIVED_FINAL AS
	SELECT
    QR_HISTORY_DELIVERY_PLAN.PART_NO AS partNo,
    qr_receiving.QR_PART_INFOR.BOX_CODE,
    QR_HISTORY_DELIVERY_PLAN.ACTUAL_QTY AS boxQty,
    QR_HISTORY_DELIVERY_PLAN.NUMBER_BOX_SCAN AS receivedBoxScan,
    QR_HISTORY_DELIVERY_PLAN.NUMBER_BOX_MANUAL AS receivedBoxHand,
    qr_receiving.QR_PART_INFOR.KIT_QTY AS receivedBoxKit,
    qr_receiving.QR_PART_INFOR.TRAY_QTY AS receivedBoxTray,
    0 AS returnBoxScan,
    0 AS returnBoxHand,
    0 AS returnBoxKit,
    0 AS returnBoxTray,
    QR_HISTORY_DELIVERY_PLAN.VENDOR AS vendor,
    QR_HISTORY_DELIVERY_PLAN.DATE_DELIVERY AS receivedDate,
    QR_HISTORY_DELIVERY_PLAN.LOCATION AS receivedLoc,
    QR_HISTORY_DELIVERY_PLAN.TIME_DELIVERY AS receivedLot,
    CONCAT(QR_HISTORY_DELIVERY_PLAN.VENDOR, QR_HISTORY_DELIVERY_PLAN.LOCATION, QR_HISTORY_DELIVERY_PLAN.DATE_DELIVERY, QR_HISTORY_DELIVERY_PLAN.TIME_DELIVERY) AS reportKey
FROM
    QR_HISTORY_DELIVERY_PLAN
INNER JOIN
    qr_receiving.QR_PART_INFOR ON QR_HISTORY_DELIVERY_PLAN.PART_NO = qr_receiving.QR_PART_INFOR.PART_NO
    AND QR_HISTORY_DELIVERY_PLAN.VENDOR = qr_receiving.QR_PART_INFOR.VENDOR;
  
CREATE VIEW QR_SUM_BOX_RETURN_FINAL AS
SELECT
    QR_BOX_CODE_PREPARE.partNo,
    CASE
        WHEN QR_BOX_CODE_PREPARE.partNo = 'Unknown' THEN SUBSTRING(QR_BOX_CODE_PREPARE.BOX_CODE, 26, LENGTH(QR_BOX_CODE_PREPARE.BOX_CODE) - 25)
        ELSE qr_receiving.QR_PART_INFOR.BOX_CODE
    END AS BOX_CODE,
    0 AS boxQty,
    0 AS receivedBoxScan,
    0 AS receivedBoxHand,
    0 AS receivedBoxKit,
    0 AS receivedBoxTray,
    CASE
        WHEN QR_BOX_CODE_PREPARE.partNo = 'Unknown' THEN 0
        ELSE QR_BOX_CODE_PREPARE.qty
    END AS returnBoxScan,
    CASE
        WHEN QR_BOX_CODE_PREPARE.partNo = 'Unknown' THEN QR_BOX_CODE_PREPARE.qty
        ELSE 0
    END AS returnBoxHand,
    CASE
        WHEN QR_BOX_CODE_PREPARE.partNo = 'Unknown' THEN SUBSTRING(QR_BOX_CODE_PREPARE.BOX_CODE, 1, 2)
        ELSE qr_receiving.QR_PART_INFOR.KIT_QTY
    END AS returnBoxKit,
    CASE
        WHEN QR_BOX_CODE_PREPARE.partNo = 'Unknown' THEN SUBSTRING(QR_BOX_CODE_PREPARE.BOX_CODE, 4, 2)
        ELSE qr_receiving.QR_PART_INFOR.TRAY_QTY
    END AS returnBoxTray,
    QR_BOX_CODE_PREPARE.vendor,
    QR_BOX_CODE_PREPARE.returnDate AS receivedDate,
    QR_BOX_CODE_PREPARE.returnLoc AS receivedLoc,
    QR_BOX_CODE_PREPARE.returnLot AS receivedLot,
    CONCAT(QR_BOX_CODE_PREPARE.vendor, QR_BOX_CODE_PREPARE.returnLoc, QR_BOX_CODE_PREPARE.returnDate, QR_BOX_CODE_PREPARE.returnLot) AS reportKey
FROM
    QR_BOX_CODE_PREPARE
LEFT OUTER JOIN
    qr_receiving.QR_PART_INFOR ON QR_BOX_CODE_PREPARE.partNo = qr_receiving.QR_PART_INFOR.PART_NO AND QR_BOX_CODE_PREPARE.vendor = qr_receiving.QR_PART_INFOR.VENDOR
WHERE
    QR_BOX_CODE_PREPARE.partNo != 'DefaultBox';

CREATE VIEW QR_SUM_BOX_REPORT_FINAL AS
SELECT * FROM QR_SUM_BOX_RECEIVED_FINAL 
UNION ALL 
SELECT * FROM QR_SUM_BOX_RETURN_FINAL;



#######################		PROCEDURE	######################


DELIMITER //

CREATE PROCEDURE SelectDynamic (IN query text)
BEGIN
    SET @sql_query = query;
    PREPARE stmt FROM @sql_query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END//
DELIMITER ;


DELIMITER //
CREATE PROCEDURE SelectTotalBoxCode (IN vendor VARCHAR(255), IN receivedDate VARCHAR(255), IN receivedLoc VARCHAR(255), IN receivedLot VARCHAR(255))
BEGIN
    SELECT 
        BOX_CODE, 
        SUM(receivedBoxScan) AS receivedBoxScan, 
        SUM(receivedBoxHand) AS receivedBoxHand, 
        SUM(receivedBoxKit) AS receivedBoxKit, 
        SUM(receivedBoxTray) AS receivedBoxTray, 
        SUM(returnBoxScan) AS returnBoxScan,
        SUM(returnBoxHand) AS returnBoxHand, 
        SUM(returnBoxKit) AS returnBoxKit, 
        SUM(returnBoxTray) AS returnBoxTray
    FROM 
        QR_SUM_BOX_REPORT_FINAL
    WHERE 
        vendor = vendor AND 
        receivedDate = receivedDate AND 
        receivedLoc = receivedLoc AND 
        receivedLot = receivedLot
    GROUP BY 
        BOX_CODE;
END//
DELIMITER ;


DELIMITER //
CREATE PROCEDURE SelectTotalBoxCodeByDate (
    IN vendor VARCHAR(255), 
    IN receivedLoc VARCHAR(255), 
    IN receivedDate VARCHAR(255), 
    IN receivedDateAfter VARCHAR(255), 
    IN receivedLot VARCHAR(255)
)
BEGIN
    SELECT 
        COALESCE(BOX_CODE, 0) AS BOX_CODE, 
        SUM(receivedBoxScan) AS receivedBoxScan, 
        SUM(receivedBoxHand) AS receivedBoxHand, 
        SUM(receivedBoxKit) AS receivedBoxKit, 
        SUM(receivedBoxTray) AS receivedBoxTray, 
        SUM(returnBoxScan) AS returnBoxScan, 
        SUM(returnBoxHand) AS returnBoxHand, 
        COALESCE(SUM(returnBoxKit), 0) AS returnBoxKit, 
        COALESCE(SUM(returnBoxTray), 0) AS returnBoxTray 
    FROM 
        QR_SUM_BOX_REPORT_FINAL
    WHERE 
        vendor = vendor AND 
        receivedLoc = receivedLoc AND 
        ((receivedDate = receivedDate AND receivedLot > receivedLot) OR 
         (receivedDate = receivedDateAfter AND receivedLot <= receivedLot))
    GROUP BY 
        BOX_CODE;
END//

DELIMITER ;

DELIMITER //

CREATE PROCEDURE SelectTotalCart (
    IN vendor VARCHAR(255), 
    IN receivedDate VARCHAR(255), 
    IN receivedLoc VARCHAR(255), 
    IN receivedLot VARCHAR(255), 
    IN typeOfCart VARCHAR(255)
)
BEGIN
    SELECT 
        CART_LOT, 
        SUM(CASE WHEN CART_STATUS = 'Output' THEN 1 ELSE 0 END) AS Output, 
        SUM(CASE WHEN CART_STATUS = 'Input' THEN 1 ELSE 0 END) AS Input
    FROM 
        QR_HISTORY_CART_DIRECT
    WHERE 
        VENDOR_NO = vendor AND 
        CART_LOC = receivedLoc AND 
        CART_DATE = receivedDate AND 
        CART_LOT = receivedLot AND 
        CART_NO LIKE CONCAT('%', typeOfCart, '%')
    GROUP BY 
        CART_LOT;
END//

DELIMITER ;


DELIMITER //

CREATE PROCEDURE SelectTotalCartByDate (
    IN vendor VARCHAR(255), 
    IN receivedLoc VARCHAR(255), 
    IN receivedDate VARCHAR(255), 
    IN receivedDateAfter VARCHAR(255), 
    IN receivedLot VARCHAR(255), 
    IN typeOfCart VARCHAR(255)
)
BEGIN
    SELECT 
        CART_LOT, 
        SUM(CASE WHEN CART_STATUS = 'Output' THEN 1 ELSE 0 END) AS Output, 
        SUM(CASE WHEN CART_STATUS = 'Input' THEN 1 ELSE 0 END) AS Input
    FROM 
        QR_HISTORY_CART_DIRECT
    WHERE 
        VENDOR_NO = vendor AND 
        CART_LOC = receivedLoc AND 
        (
            (CART_DATE = receivedDate AND CART_LOT > receivedLot) OR 
            (CART_DATE = receivedDateAfter AND CART_LOT <= receivedLot)
        ) AND 
        CART_NO LIKE CONCAT('%', typeOfCart, '%')
    GROUP BY 
        CART_LOT;
END//

DELIMITER ;


DELIMITER //

CREATE PROCEDURE SelectTotalItem (
    IN vendor VARCHAR(255), 
    IN receivedDate VARCHAR(255), 
    IN receivedLoc VARCHAR(255), 
    IN receivedLot VARCHAR(255)
)
BEGIN
    SELECT 
        partNo, 
        BOX_CODE, 
        SUM(boxQty) AS boxQty, 
        SUM(receivedBoxScan) AS receivedBoxScan, 
        SUM(receivedBoxHand) AS receivedBoxHand, 
        CASE WHEN SUM(receivedBoxScan) + SUM(receivedBoxHand) = 0 THEN 0 ELSE SUM(receivedBoxKit) END AS receivedBoxKit, 
        CASE WHEN SUM(receivedBoxScan) + SUM(receivedBoxHand) = 0 THEN 0 ELSE SUM(receivedBoxTray) END AS receivedBoxTray, 
        SUM(returnBoxScan) AS returnBoxScan, 
        SUM(returnBoxHand) AS returnBoxHand, 
        CASE WHEN SUM(returnBoxScan) + SUM(returnBoxHand) = 0 THEN 0 ELSE SUM(returnBoxKit) END AS returnBoxKit, 
        CASE WHEN SUM(returnBoxScan) + SUM(returnBoxHand) = 0 THEN 0 ELSE SUM(returnBoxTray) END AS returnBoxTray,
        vendor, 
        receivedDate,  
        receivedLoc,  
        receivedLot, 
        reportKey
    FROM 
        QR_SUM_BOX_REPORT_FINAL
    WHERE 
        vendor = vendor AND 
        receivedDate = receivedDate AND 
        receivedLoc = receivedLoc AND 
        receivedLot = receivedLot
    GROUP BY 
        partNo, BOX_CODE, vendor, receivedDate, receivedLoc, receivedLot, reportKey;
END//

DELIMITER ;


DELIMITER //

CREATE PROCEDURE SelectTotalItemByDate (
    IN vendor VARCHAR(255), 
    IN receivedLoc VARCHAR(255),  
    IN receivedDate VARCHAR(255), 
    IN receivedDateAfter VARCHAR(255), 
    IN receivedLot VARCHAR(255)
)
BEGIN
    SELECT 
        CASE partNo WHEN 'Unknown' THEN BOX_CODE ELSE partNo END AS partNo, 
        IFNULL(BOX_CODE, 0) AS BOX_CODE, 
        SUM(boxQty) AS boxQty, 
        SUM(receivedBoxScan) AS receivedBoxScan, 
        SUM(receivedBoxHand) AS receivedBoxHand, 
        CASE WHEN SUM(receivedBoxScan) + SUM(receivedBoxHand) = 0 THEN 0 ELSE SUM(receivedBoxKit) END AS receivedBoxKit, 
        CASE WHEN SUM(receivedBoxScan) + SUM(receivedBoxHand) = 0 THEN 0 ELSE SUM(receivedBoxTray) END AS receivedBoxTray,
        SUM(returnBoxScan) AS returnBoxScan, 
        SUM(returnBoxHand) AS returnBoxHand, 
        IFNULL(SUM(returnBoxKit), 0) AS returnBoxKit, 
        IFNULL(SUM(returnBoxTray), 0) AS returnBoxTray, 
        vendor, 
        receivedDate,  
        receivedLoc,  
        receivedLot 
    FROM 
        QR_SUM_BOX_REPORT_FINAL
    WHERE 
        vendor = vendor AND 
        receivedLoc = receivedLoc AND 
        ((receivedDate = receivedDate AND receivedLot > receivedLot) OR 
         (receivedDate = receivedDateAfter AND receivedLot <= receivedLot)) 
    GROUP BY 
        partNo, BOX_CODE, vendor, receivedLoc, receivedDate, receivedLot;
END//

DELIMITER ;


####################	TRIGGER		###########################
DELIMITER //

CREATE TRIGGER QR_HISTORY_BOX_SHIKYU_UPDATE AFTER INSERT ON QR_HISTORY_BOX_SHIKYU
FOR EACH ROW
BEGIN
    UPDATE QR_BOX_SHIKYU
    SET Current_status = NEW.BOX_STATUS,
        Current_port = NEW.BOX_LOC,
        Last_date = NEW.BOX_DATE,
        Last_time = NEW.BOX_LOT,
        Real_time = NEW.BOX_TIME
    WHERE Box_no = NEW.BOX_NO AND Vendor = NEW.VENDOR_NO;
END //

DELIMITER ;


DELIMITER //

CREATE TRIGGER QR_HISTORY_CART_DIRECT_UPDATE AFTER INSERT ON QR_HISTORY_CART_DIRECT
FOR EACH ROW
BEGIN
    UPDATE QR_BOX_CODE_PREPARE
    SET returnDate = NEW.CART_DATE,
        returnTime = NEW.CART_TIME,
        returnLot = NEW.CART_LOT,
        returnLoc = NEW.CART_LOC
    WHERE vendor = NEW.VENDOR_NO
        AND loadingCart = NEW.CART_NO
        AND returnLot IS NULL
        AND loadingStatus != '1'
        AND NEW.CART_STATUS = 'Output';
END //

DELIMITER ;


DELIMITER //

CREATE TRIGGER QR_HISTORY_CART_DIRECT_UPDATE_CART AFTER INSERT ON QR_HISTORY_CART_DIRECT
FOR EACH ROW
BEGIN
    UPDATE QR_CART_DIRECT
    SET Current_status = NEW.CART_STATUS,
        Current_port = NEW.CART_LOC,
        Last_date = NEW.CART_DATE,
        Last_time = NEW.CART_LOT,
        Real_time = NEW.CART_TIME
    WHERE Cart_no = NEW.CART_NO AND Vendor = NEW.VENDOR_NO;
END //

DELIMITER ;


qr_history_delivery_plan
DELIMITER //

CREATE TRIGGER QR_HISTORY_DELIVERY_PLAN_UPDATE AFTER UPDATE ON QR_HISTORY_DELIVERY_PLAN
FOR EACH ROW
BEGIN
    DECLARE TIME_SEVEN VARCHAR(50);
    DECLARE TIME_TWENTY VARCHAR(50);
    DECLARE SHIFT_NAME VARCHAR(10);
    DECLARE DATE_CURRENT VARCHAR(50);
    DECLARE DATE_BEFORE VARCHAR(50);
    DECLARE SHIFT_DATE VARCHAR(50);
    DECLARE TIME_SERVER VARCHAR(50);

    SET TIME_SEVEN = '07:10:00';
    SET TIME_TWENTY = '20:10:00';
    SET TIME_SERVER = TIME_FORMAT(NOW(), '%H:%i:%s');
    SET DATE_CURRENT = DATE_FORMAT(NOW(), '%Y%m%d');
    SET DATE_BEFORE = DATE_FORMAT(DATE_SUB(NOW(), INTERVAL 1 DAY), '%Y%m%d');

    IF TIME_SERVER > TIME_SEVEN AND TIME_SERVER <= TIME_TWENTY THEN
        SET SHIFT_NAME = '1';
    ELSE
        SET SHIFT_NAME = '2';
    END IF;

    IF SHIFT_NAME = '1' OR (SHIFT_NAME = '2' AND TIME_SERVER > '20:10:00') THEN
        SET SHIFT_DATE = DATE_CURRENT;
    ELSE
        SET SHIFT_DATE = DATE_BEFORE;
    END IF;

    UPDATE InventoryUpdateQty
    SET STORE_B = CASE 
                        WHEN NEW.LOCATION = 'QVB' THEN STORE_B + NEW.ACTUAL_QTY
                        ELSE STORE_B
                    END,
        STORE_C = CASE 
                        WHEN NEW.LOCATION = 'QVC' THEN STORE_C + NEW.ACTUAL_QTY
                        ELSE STORE_C
                    END,
        STORE_D = CASE 
                        WHEN NEW.LOCATION = 'QVD' THEN STORE_D + NEW.ACTUAL_QTY
                        ELSE STORE_D
                    END,
        STORE_F = CASE 
                        WHEN NEW.LOCATION = 'QVF' THEN STORE_F + NEW.ACTUAL_QTY
                        ELSE STORE_F
                    END
    WHERE NEW.PART_NO + NEW.VENDOR = partNumber 
        AND NEW.ACTUAL_QTY = NEW.QTY_PLAN 
        AND NEW.PROBLEM = 1;

    INSERT INTO InventoryMovingHistory (movingDate, movingTime, partNumber, inOutCode, movingQty, movingBCFrom, inventoryAtFrom, movingBCTo, inventoryAtTo, employeeCode, movingCode, shiftName, shiftDate)
    SELECT DATE_CURRENT, TIME_SERVER, NEW.PART_NO + NEW.VENDOR, '100', SUM(NEW.ACTUAL_QTY), NEW.VENDOR, 0,
        CASE NEW.LOCATION
            WHEN 'QVB' THEN 'STORE_B'
            WHEN 'QVC' THEN 'STORE_C'
            WHEN 'QVD' THEN 'STORE_D'
            WHEN 'QVF' THEN 'STORE_F'
            ELSE 'OTHER'
        END,
        CASE NEW.LOCATION
            WHEN 'QVB' THEN (SELECT STORE_B FROM InventoryUpdateQty WHERE partNumber = NEW.PART_NO + NEW.VENDOR)
            WHEN 'QVC' THEN (SELECT STORE_C FROM InventoryUpdateQty WHERE partNumber = NEW.PART_NO + NEW.VENDOR)
            WHEN 'QVD' THEN (SELECT STORE_D FROM InventoryUpdateQty WHERE partNumber = NEW.PART_NO + NEW.VENDOR)
            WHEN 'QVF' THEN (SELECT STORE_F FROM InventoryUpdateQty WHERE partNumber = NEW.PART_NO + NEW.VENDOR)
            ELSE 0
        END,
        '460942', 
        CASE 
            WHEN NEW.DS_KEY = '0' THEN NEW.DELIVERY_KEY 
            ELSE NEW.DS_KEY
        END,
        SHIFT_NAME, SHIFT_DATE
    FROM NEW 
    WHERE NEW.ACTUAL_QTY = NEW.QTY_PLAN 
        AND NEW.PROBLEM = 1
    GROUP BY NEW.PART_NO, NEW.VENDOR, NEW.ACTUAL_QTY, NEW.LOCATION, NEW.DS_KEY, NEW.DELIVERY_KEY;
END //

DELIMITER ;


