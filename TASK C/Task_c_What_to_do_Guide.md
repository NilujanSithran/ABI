# Task (c) – Digitized STDA Area Map (10 Marks)

## What you are expected to do

### Step 1: Get a base image
- Find **Sri Lanka Tourism Development Authority (STDA)** on **Google Maps** or **Google Earth**.
- Capture an image of the **STDA area and surrounding suburbs** (enough to show buildings, roads, and nearby services).
- Save as a raster image (e.g. PNG or JPG).  
  **Tip:** In Google Earth Pro you can use File → Save → Save Image; in Google Maps use a screenshot or a print-to-image tool.

### Step 2: Geo-reference the image (MANDATORY)
- Open **QGIS** and create a new project.
- Set the project CRS to **EPSG:5234** (Kandawala / Sri Lanka Grid):  
  **Project → Properties → CRS** → search for **5234** → select **EPSG:5234 – Kandawala / Sri Lanka Grid**.
- **Raster → Georeferencer** (or **Plugins → Georeferencer GDAL** if needed).
- Add your image (e.g. **File → Open raster**).
- Add **Ground Control Points (GCPs)**:  
  - Click known locations on the image (e.g. road corners, building corners) and enter their coordinates.  
  - You can get coordinates from Google Maps (right-click → “What’s here?” shows lat/lon). Convert WGS84 (EPSG:4326) to EPSG:5234 in QGIS or with an online converter, or use a basemap in 5234 to pick points.
- Set the **Transformation settings**: output CRS = **EPSG:5234**, resolution, and output path for the georeferenced raster.
- Run the transformation. The result is a **georeferenced image** in EPSG:5234 that you can add to your map.

### Step 3: Digitize vector layers
Create **vector layers** (points, lines, or polygons as appropriate) on top of the georeferenced image.  
**Each layer must have these attributes:** **id**, **name**, **type**, **size**.

| Layer | Geometry | What to digitize | Example attributes |
|-------|----------|-------------------|---------------------|
| **STDA buildings** | Polygon | Main STDA building(s) | id=1, name=STDA HQ, type=Office, size=… (e.g. sq m or category) |
| **Roads** | Line | Roads around STDA | id=1, name=Galle Rd, type=Road, size=… (e.g. width or category) |
| **Nearby services** | Point or Polygon | Shops, banks, hotels, etc. | id=1, name=Bank, type=Bank, size=… |

**How to create layers in QGIS:**
- **Layer → Create Layer → New Shapefile Layer** (or New GeoPackage Layer).  
- Choose geometry type (Point / Line / Polygon), set CRS = **EPSG:5234**.  
- Add fields: **id** (Integer), **name** (Text), **type** (Text), **size** (Text or Integer/Decimal as needed).  
- Toggle editing, then use **Add feature** to digitize over the georeferenced image. Fill **id**, **name**, **type**, **size** for each feature.  
- Save edits and repeat for each layer (STDA buildings, Roads, Nearby services).

### Step 4: Discussion (write in your report)
Answer in your own words:
1. **Why STDA’s location matters** (e.g. access, visibility, connectivity, government/tourism hub).
2. **How geography improves operations island-wide** (e.g. central/easy reach, transport links, coordination with regions).

---

## Checklist
- [ ] Base image of STDA and surrounding suburbs obtained (Google Maps/Earth).
- [ ] Image georeferenced in QGIS with CRS **EPSG:5234**.
- [ ] At least three vector layers: **STDA buildings**, **Roads**, **Nearby services**.
- [ ] Each layer has attributes: **id**, **name**, **type**, **size**.
- [ ] Map exported (e.g. PDF/PNG) showing georeferenced basemap + digitized layers.
- [ ] Discussion written: why STDA’s location matters; how geography improves operations island-wide.

---

## CRS note
**EPSG:5234** = Kandawala / Sri Lanka Grid (metres). Your georeferenced image and all vector layers must be in this CRS. Set the **project** to EPSG:5234 before you start.
