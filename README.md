# GPU Analysis


This script provides a comprehensive solution for plotting and comparing GPU specifications from Intel, AMD, and NVIDIA. It reads data from CSV files, applies optional filtering criteria (budget, VRAM, TDP), and generates a wide range of plots grouped by brand, generation, and universal comparisons across multiple generations. 

Below is a step-by-step description of how the script works and how to use it.

---

## Table of Contents
1. [Overview](#overview)
2. [Prerequisites](#prerequisites)
3. [Script Configuration](#script-configuration)
4. [Data Filtering Logic](#data-filtering-logic)
5. [Plot Generation](#plot-generation)
6. [Detailed Plots](#detailed-plots)
7. [Brand Comparisons](#brand-comparisons)
8. [File Saving Structure](#file-saving-structure)
9. [Usage Instructions](#usage-instructions)

---

## 1. Overview
This R script is intended to help you visualize and compare GPU data from multiple vendors (Intel, AMD, and NVIDIA). It:
- Reads three CSV files (one for each vendor).
- Offers optional filtering (by price, VRAM, and TDP).
- Generates scatter plots with linear regression lines for various GPU parameters (Score, MSRP, VRAM, FP16 performance, TDP, etc.).
- Saves the resulting plots in separate folders.

Key features:
- **Configurable Filtering**: Easily specify budget, minimum VRAM, or max TDP.
- **Detailed Analysis**: Optionally generate additional plots (SP, TMU, ROP, Transistors, etc.) if `detailed = TRUE`.
- **Brand-Wide Comparisons**: Compare different brands side by side, grouped by GPU generations.
- **Automated Plot Saving**: All plots are automatically saved to organized subfolders.

---

## 2. Prerequisites
- **R Language**: The script is written in R.
- **Packages**:
  1. `ggplot2` for generating plots.
  2. `ggrepel` for creating non-overlapping text labels on the plots.
- **CSV Data Files**: Three CSV files named:
  - `Intel.csv`
  - `AMD.csv`
  - `NVIDIA.csv`

Each CSV is expected to have columns compatible with the script’s references (e.g., `GPU`, `Generation`, `MSRP`, `Score`, `VRAM`, `TDP`, `FP16`, etc.).

---

## 3. Script Configuration
Inside the script, several global variables control how data is filtered and how plots are generated:

```r
budgetCard <- FALSE   # Toggle for budget filtering
budget     <- 1300    # Maximum allowed MSRP if budgetCard = TRUE

VRAMRequired <- FALSE # Toggle for VRAM filtering
VRAMMin      <- 12    # Minimum VRAM requirement

TDPConstraint <- FALSE # Toggle for TDP filtering
TDPMax        <- 350   # Maximum TDP allowed if TDPConstraint = TRUE

detailed <- TRUE # If TRUE, creates extra "detailed" plots (SP, TMU, ROP, Transistors, etc.)
```

- **`budgetCard`**: When set to `TRUE`, only GPUs with `MSRP <= budget` are kept.
- **`VRAMRequired`**: When set to `TRUE`, only GPUs with `VRAM >= VRAMMin` are kept.
- **`TDPConstraint`**: When set to `TRUE`, only GPUs with `TDP <= TDPMax` are kept.
- **`detailed`**: When set to `TRUE`, script produces additional plots correlating GPU internal parameters (e.g., SP, ROP) with both `MSRP` and `Score`.

---

## 4. Data Filtering Logic
After reading in the data, the script checks the three Boolean variables—`budgetCard`, `VRAMRequired`, and `TDPConstraint`—and applies corresponding `subset()` operations:

```r
if (budgetCard) {
    df.intel  <- subset(df.intel,  MSRP <= budget)
    df.amd    <- subset(df.amd,    MSRP <= budget)
    df.nvidia <- subset(df.nvidia, MSRP <= budget)
    # Prints budget info
}

if (VRAMRequired) {
    df.intel  <- subset(df.intel,  VRAM >= VRAMMin)
    df.amd    <- subset(df.amd,    VRAM >= VRAMMin)
    df.nvidia <- subset(df.nvidia, VRAM >= VRAMMin)
    # Prints VRAM info
}

if (TDPConstraint) {
    df.intel  <- subset(df.intel,  TDP <= TDPMax)
    df.amd    <- subset(df.amd,    TDP <= TDPMax)
    df.nvidia <- subset(df.nvidia, TDP <= TDPMax)
    # Prints TDP info
}
```

This optional filtering ensures only the GPUs meeting your criteria appear in the final plots.

---

## 5. Plot Generation
The script uses **ggplot2** extensively. Each brand section proceeds as follows:

1. Convert the `Generation` column to a factor:  
   ```r
   df.nvidia$Generation <- as.factor(df.nvidia$Generation)
   ```
2. Create multiple plots correlating different x-axes and y-axes. Common examples:
   - `MSRP` vs. `Score`
   - `Config` vs. `Score`
   - `TDP` vs. `Score`
   - `MSRP` vs. `VRAM`
   - `MSRP` vs. `Config`
   - `MSRP` vs. `FP16`
   - `MSRP` vs. `TDP`
   - `Generation` vs. `Score`
   - `Generation` vs. `FP16`
   - `Generation` vs. `TDP`
   - `Generation` vs. `VRAM`
   - `Generation` vs. `Config`

3. Save each plot as a PNG in the corresponding folder (e.g., `plot\\NVIDIA\\`, `plot\\Intel\\`, `plot\\AMD\\`) with a preset width and height:
   ```r
   ggsave("plot\\NVIDIA\\nvidiaMSRP.png", nvMSRP, width = 10, height = 12)
   ```

---

## 6. Detailed Plots
If `detailed` is `TRUE`, the script will generate additional plots related to more specific GPU architecture parameters:
- **SP** (Streaming Processors or Shader Processors) vs. `Score`
- **TMU** (Texture Mapping Units) vs. `Score`
- **ROP** (Render Output Pipelines) vs. `Score`
- **Transistors** vs. `Score`
- And also the cross relations: `MSRP` vs. `SP`, `MSRP` vs. `TMU`, etc.

These are saved in the same subfolders, prefixed or named accordingly (e.g., `nvidiaSP.png`, `nvidiaTMU.png`, etc.).

---

## 7. Brand Comparisons
After generating individual brand plots, the script proceeds to **universal comparisons** grouped by GPU generations. It subsets each brand’s data by a specific generation label and then combines them for direct comparison:

1. **2025 GPU**:  
   - NVIDIA Generation == "50"  
   - AMD Generation == "9000"  
   - Intel Generation == "B"

2. **2022-2024 GPU**:  
   - NVIDIA Generation == "40"  
   - AMD Generation == "7000"  
   - Intel Generation == "A"

3. **2020-2022 GPU**:  
   - NVIDIA Generation == "30"  
   - AMD Generation == "6000"

4. **2018-2019 GPU**:  
   - NVIDIA Generation == "20"  
   - AMD Generation == "5000"

5. **All GPU**  
   - Combines everything from the above subsets.

For each combined subset, the script generates and saves plots that compare `MSRP vs. Score`, `MSRP vs. VRAM`, `Generation vs. Score`, etc., but **color-codes** or **groups** by brand (AMD, Intel, NVIDIA). This way, you can visually see how GPUs from different vendors stack up in the same generation.

---

## 8. File Saving Structure
The script saves all generated plots into various subfolders under a `plot\\` directory:

```
plot
├── NVIDIA
│   ├── nvidiaMSRP.png
│   ├── nvidiaConfig.png
│   ├── ...
├── Intel
│   ├── intelMSRP.png
│   ├── intelConfig.png
│   ├── ...
├── AMD
│   ├── amdMSRP.png
│   ├── amdConfig.png
│   ├── ...
└── Universal
    ├── 2025GPU
    │   ├── 2025ScorePlot.png
    │   ├── ...
    ├── 2022-2024GPU
    │   ├── 2022-2024ScorePlot.png
    │   ├── ...
    ├── 2020-2022GPU
    │   ├── 2020-2022ScorePlot.png
    │   ├── ...
    ├── 2018-2019GPU
    │   ├── 2018-2019ScorePlot.png
    │   ├── ...
    └── AllGPU
        ├── AllScorePlot.png
        ├── ...
```

---

## 9. Usage Instructions

1. **Install Required R Packages**  
   ```r
   install.packages("ggplot2")
   install.packages("ggrepel")
   install.packages("useful")
   ```

2. **Prepare the CSV Files**  
   - Place `Intel.csv`, `AMD.csv`, `NVIDIA.csv` inside a `data\\` folder.
   - Ensure each file has the necessary columns (GPU, Generation, MSRP, Score, VRAM, TDP, FP16, etc.).

3. **Adjust the Script Parameters** (optional)  
   - Set `budgetCard`, `VRAMRequired`, `TDPConstraint`, `detailed` to `TRUE` or `FALSE` as needed.
   - Update `budget`, `VRAMMin`, `TDPMax` to desired values.

4. **Run the Script**  
   - Launch R or RStudio and execute the script.
   - Watch for printed messages like “Starting...”, “Nvidia Complete”, “Plots Saved to plot/...”, etc.

5. **Check the Output**  
   - After execution, explore the `plot\\` directory.
   - Each brand has its own folder, and the universal comparisons are inside `plot\\Universal\\`.

6. **Further Customization**  
   - Edit `scale_x_continuous()` / `scale_y_continuous()` to change axis breaks or ranges.
   - Add or remove `geom_smooth()` calls if you don’t want linear regression lines.
   - Adjust the color mapping, label size, or any ggplot2 parameters as you see fit.

