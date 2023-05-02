-- CONNECTION: name=VARIAN Production
SELECT
  VolumeType,
  Description AS VolumeDescription,
  ObjectStatus AS VolumeTypeStatus,
  DicomType AS DicomStructureType,
  CASE
    WHEN OverlapFlag = 0 THEN 'FALSE'
    WHEN OverlapFlag = 1 THEN 'TRUE'
  END AS StructureOverlap

FROM
  VolumeType
-- WHERE ObjectStatus LIKE 'Active'
