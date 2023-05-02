-- CONNECTION: name=VARIAN Production
SELECT
  DICOMCodeValue.Value AS 'Code',
  DICOMCodeScheme.Designator AS 'Scheme',
  DICOMCodeScheme.Version AS 'Version',
  DICOMCodeMeaning.DisplayName AS 'Label',
  StructureCode.Synonyms AS 'Synonyms',
  StructureCode.DefaultStructureId AS 'Default  Structure Id',
  CASE
    WHEN VARIAN.dbo.StructureCode.ActiveSubsetFlag = 0 THEN 'FALSE'
    WHEN VARIAN.dbo.StructureCode.ActiveSubsetFlag = 1 THEN 'TRUE'
  END AS Active,
  CASE
    WHEN VARIAN.dbo.StructureCode.ProtectedSubsetFlag = 0 THEN 'FALSE'
    WHEN VARIAN.dbo.StructureCode.ProtectedSubsetFlag = 1 THEN 'TRUE'
  END AS Protected
FROM
  VARIAN.dbo.StructureCode
LEFT JOIN VARIAN.dbo.DICOMCodeValue
  ON VARIAN.dbo.StructureCode.DICOMCodeValueSer = VARIAN.dbo.DICOMCodeValue.DICOMCodeValueSer
LEFT JOIN VARIAN.dbo.DICOMCodeScheme
  ON VARIAN.dbo.DICOMCodeValue.DICOMCodeSchemeSer = VARIAN.dbo.DICOMCodeScheme.DICOMCodeSchemeSer
LEFT JOIN VARIAN.dbo.DICOMCodeMeaning
  ON VARIAN.dbo.StructureCode.DICOMCodeValueSer = VARIAN.dbo.DICOMCodeMeaning.DICOMCodeValueSer
-- WHERE
--   VARIAN.dbo.StructureCode.ActiveSubsetFlag = 1
