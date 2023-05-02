-- CONNECTION: name=VARIAN Production
SELECT
  MaterialId AS 'ColorId',
  MaterialName AS 'ColorName',
  Color2D AS '2D_Color',
  CASE
    WHEN Rendering2DModel LIKE 'Voxel' THEN 'Segment'
    WHEN Rendering2DModel LIKE 'Lines' THEN 'Contour'
    WHEN Rendering2DModel LIKE 'Translucent' THEN 'Translucent'
    ELSE ''
    END AS '2D_View',
  CASE
    WHEN Rendering2DModel LIKE 'Translucent' THEN Translucency2D
    ELSE NULL
    END AS '2D_Translucency',
  AmbientColor AS '3D_Color',
  CASE
    WHEN Rendering3DModel LIKE 'Voxel' THEN 'Segment'
    WHEN Rendering3DModel LIKE 'Wireframe' THEN 'Contour'
    WHEN Rendering3DModel LIKE 'Translucent' THEN 'Translucent'
    ELSE ''
    END AS '3D_View',
  CASE
    WHEN Rendering3DModel LIKE 'Translucent' THEN Translucency3D
    ELSE NULL
    END AS '3D_Translucency',
  Translucency3D AS '3D_Translucency'
FROM
  VARIAN.dbo.Material
