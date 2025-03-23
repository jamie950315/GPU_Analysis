# GPU_Analysis

## Overview
This R script is designed to analyze and visualize GPU performance data across major brands: Nvidia, AMD, and Intel. It utilizes the `ggplot2` and `ggrepel` packages to create comprehensive scatter plots and trend analyses based on various GPU specifications such as MSRP, VRAM, Streaming Processors (SP), Texture Mapping Units (TMU), Raster Operation Pipelines (ROP), and more.

---

## Prerequisites
- R language installed
- Required R libraries:
  - `ggplot2`
  - `ggrepel`
  - `useful`

Install these libraries in R using:
```r
install.packages(c("ggplot2", "ggrepel", "useful"))
```

---

## Data Requirements
Ensure your working directory has a `data` folder containing:
- `Intel.csv`
- `AMD.csv`
- `NVIDIA.csv`

The CSV files should include columns such as GPU, Generation, MSRP, VRAM, SP, TMU, ROP, Transistors, Config, and Score.

---

## Directory Structure
```
GPU_Analysis/
│
├── GPU_Analysis.R
├── data/
│   ├── Intel.csv
│   ├── AMD.csv
│   └── NVIDIA.csv
└── plot/
    ├── NVIDIA/
    ├── Intel/
    ├── AMD/
    └── Universal/
        ├── 2025GPU/
        ├── 2022-2024GPU/
        ├── 2020-2022GPU/
        ├── 2018-2019GPU/
        └── AllGPU/
```

---

## Running the Script
Run the script using RStudio or your preferred R environment:
```r
source("GPU_Analysis.R")
```

The script performs the following:
- Loads and optionally filters the GPU data based on budget or VRAM criteria.
- Generates scatter plots for various specifications vs. GPU Score.
- Creates comparative plots between brands and generations.
- Saves all plots to their respective directories as PNG files.

---

## Plot Descriptions
Each GPU brand (Nvidia, Intel, AMD) has plots analyzing:
- SP vs. Score
- TMU vs. Score
- ROP vs. Score
- MSRP vs. Score
- Transistors vs. Score
- Config vs. Score
- MSRP vs. other specifications (Transistors, VRAM, SP, TMU, ROP, Config)

Universal comparisons across brands include:
- MSRP vs. Score for different generation groups
- MSRP vs. VRAM for different generation groups
- Comprehensive "AllGPU" analyses combining all generation data.

---

## Customization
- Modify `budgetCard` and `VRAMSpecified` variables in the script to apply custom filters.
- Adjust paths and directories as needed based on your file structure.

---

## Output
All generated plots will be stored under the `plot/` directory, structured clearly by GPU brands and universal comparisons.

---

## Contributing
Feel free to ask questions, open issues, and submit pull requests. Contributions from others are welcome to help enhance the project!

---

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

