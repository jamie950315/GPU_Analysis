df.intel<-data.frame(read.csv("data\\Intel.csv", header = TRUE))
df.amd<-data.frame(read.csv("data\\AMD.csv", header = TRUE))
df.nvidia<-data.frame(read.csv("data\\NVIDIA.csv", header = TRUE))


budgetCard<-FALSE
budget<-1300
VRAMSpecfied<-FALSE
VRAMLimit<-12

if(budgetCard){
    df.intel<-subset(df.intel, MSRP<=budget)
    df.amd<-subset(df.amd, MSRP<=budget)
    df.nvidia<-subset(df.nvidia, MSRP<=budget)

    print("Budget Card Specified")
    print(paste("Budget: ", budget))
}

if(VRAMSpecfied){
    df.intel<-subset(df.intel, VRAM==VRAMLimit)
    df.amd<-subset(df.amd, VRAM==VRAMLimit)
    df.nvidia<-subset(df.nvidia, VRAM==VRAMLimit)

    print("VRAM Specified")
    print(paste("VRAM: ", VRAMLimit))
}

require("useful")
require("ggrepel")


print("Starting...")

#nvidia
print("Nvidia Start")

df.nvidia$Generation <- as.factor(df.nvidia$Generation)

nvSP <- ggplot(df.nvidia, aes(x = SP, y = Score, color = Generation)) +
    geom_point()+
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +

    geom_smooth(method = "lm", se = FALSE, alpha = 0.2, linewidth = 0.5, aes(group = Generation)) +
    labs(title = "SP - Score",
        x = "SP",
        y = "Score",
        color = "Generation") 

nvTMU <- ggplot(df.nvidia, aes(x = TMU, y = Score, color = Generation)) +
    geom_point()+
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, alpha = 0.2, linewidth = 0.5, aes(group = Generation)) +
    labs(title = "TMU - Score",
        x = "TMU",
        y = "Score",
        color = "Generation") 

nvROP <- ggplot(df.nvidia, aes(x = ROP, y = Score, color = Generation)) +
    geom_point()+
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, alpha = 0.2, linewidth = 0.5, aes(group = Generation)) +
    labs(title = "ROP - Score",
        x = "ROP",
        y = "Score",
        color = "Generation")

nvMSRP <- ggplot(df.nvidia, aes(x = MSRP, y = Score, color = Generation)) +
    geom_point()+
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, alpha = 0.2, linewidth = 0.5, aes(group = Generation)) +
    scale_x_continuous(breaks = c(seq(300, 1800, by = 200),1200,2000,2500)) +
    labs(title = "MSRP - Score",
        x = "MSRP (USD)",
        y = "Score",
        color = "Generation")

nvTransistors <- ggplot(df.nvidia, aes(x = Transistors, y = Score, color = Generation)) +
    geom_point()+
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, alpha = 0.2, linewidth = 0.5, aes(group = Generation)) +
    labs(title = "Transistors - Score",
        x = "Transistors (B)",
        y = "Score",
        color = "Generation")

nvConfig <- ggplot(df.nvidia, aes(x = Config, y = Score, color = Generation)) +
    geom_point()+
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, alpha = 0.2, linewidth = 0.5, aes(group = Generation)) +
    labs(title = "Config - Score",
        x = "Config",
        y = "Score",
        color = "Generation")

nvFP16 <- ggplot(df.nvidia, aes(x = FP16, y = Score, color = Generation))+
    geom_point()+
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, alpha = 0.2, linewidth = 0.5, aes(group = Generation)) +
    labs(title = "FP16 - Score",
        x = "FP16 (TFLOPS)",
        y = "Score",
        color = "Generation")

nvTDP <- ggplot(df.nvidia, aes(x = TDP, y = Score, color = Generation))+
    geom_point()+
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    scale_x_continuous(breaks = seq(0, 1000, by=25)) +
    geom_smooth(method = "lm", se = FALSE, alpha = 0.2, linewidth = 0.5, aes(group = Generation)) +
    labs(title = "TDP - Score",
         x = "TDP (W)",
         y = "Score",
         color = "Generation")


ggsave("plot\\NVIDIA\\nvidiaSP.png", nvSP, width = 10, height = 12)
ggsave("plot\\NVIDIA\\nvidiaTMU.png", nvTMU, width = 10, height = 12)
ggsave("plot\\NVIDIA\\nvidiaROP.png", nvROP, width = 10, height = 12)
ggsave("plot\\NVIDIA\\nvidiaMSRP.png", nvMSRP, width = 10, height = 12)
ggsave("plot\\NVIDIA\\nvidiaTransistors.png", nvTransistors, width = 10, height = 12)
ggsave("plot\\NVIDIA\\nvidiaConfig.png", nvConfig, width = 10, height = 12)
ggsave("plot\\NVIDIA\\nvidiaFP16.png", nvFP16, width = 10, height = 12)
ggsave("plot\\NVIDIA\\nvidiaTDP.png", nvTDP, width = 10, height = 12)



nvMSRPtoTransistors <- ggplot(df.nvidia, aes
(x = MSRP, y = Transistors, color = Generation)) +
    geom_point()+
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, alpha = 0.2, linewidth = 0.5, aes(group = Generation)) +
    scale_x_continuous(breaks = c(seq(300, 2000, by = 200),2000,2500)) +
    scale_y_continuous(breaks = seq(0,200, by=5)) +
    labs(title = "MSRP - Transistors",
        x = "MSRP (USD)",
        y = "Transistors (B)",
        color = "Generation")

nvMSRPtoVRAM <- ggplot(df.nvidia, aes(x = MSRP, y = VRAM, color = Generation)) +
    geom_point()+
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, alpha = 0.2, linewidth = 0.5, aes(group = Generation)) +
    scale_y_continuous(breaks = c(4, 8, 11, 12, 16, 24, 32)) +
    scale_x_continuous(breaks = c(seq(300, 2000, by = 200),2000,2500)) +
    labs(title = "MSRP - VRAM",
        x = "MSRP (USD)",
        y = "VRAM (GB)",
        color = "Generation")

nvMSRPtoSP <- ggplot(df.nvidia, aes(x = MSRP, y = SP, color = Generation)) +
    geom_point()+
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, alpha = 0.2, linewidth = 0.5, aes(group = Generation)) +
    scale_x_continuous(breaks = c(seq(300, 2000, by = 200),2000,2500)) +
    labs(title = "MSRP - SP",
        x = "MSRP (USD)",
        y = "SP",
        color = "Generation")

nvMSRPtoTMU <- ggplot(df.nvidia, aes(x = MSRP, y = TMU, color = Generation)) +
    geom_point()+
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, alpha = 0.2, linewidth = 0.5, aes(group = Generation)) +
    scale_x_continuous(breaks = c(seq(300, 2000, by = 200),2000,2500)) +
    labs(title = "MSRP - TMU",
        x = "MSRP (USD)",
        y = "TMU",
        color = "Generation")

nvMSRPtoROP <- ggplot(df.nvidia, aes(x = MSRP, y = ROP, color = Generation)) +
    geom_point()+
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, alpha = 0.2, linewidth = 0.5, aes(group = Generation)) +
    scale_x_continuous(breaks = c(seq(300, 2000, by = 200),2000,2500)) +
    labs(title = "MSRP - ROP",
        x = "MSRP (USD)",
        y = "ROP",
        color = "Generation")

nvMSRPtoConfig <- ggplot(df.nvidia, aes(x = MSRP, y = Config, color = Generation)) +
    geom_point()+
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, alpha = 0.2, linewidth = 0.5, aes(group = Generation)) +
    scale_x_continuous(breaks = c(seq(300, 1800, by = 200),2000,2500)) +
    labs(title = "MSRP - Config",
        x = "MSRP (USD)",
        y = "Config",
        color = "Generation")

nvMSRPtoFP16 <- ggplot(df.nvidia, aes(x = MSRP, y = FP16, color = Generation)) +
    geom_point()+
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, alpha = 0.2, linewidth = 0.5, aes(group = Generation)) +
    scale_x_continuous(breaks = c(seq(300, 2000, by = 200),2000,2500)) +
    scale_y_continuous(breaks = seq(0, 120, by=5)) +
    labs(title = "MSRP - FP16",
        x = "MSRP (USD)",
        y = "FP16 (TFLOPS)",
        color = "Generation")

nvMSRPtoTDP <- ggplot(df.nvidia, aes(x = MSRP, y = TDP, color = Generation)) +
    geom_point()+
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, alpha = 0.2, linewidth = 0.5, aes(group = Generation)) +
    scale_x_continuous(breaks = c(seq(300, 2000, by = 200),2000,2500)) +
    scale_y_continuous(breaks = seq(0, 1000, by=25)) +
    labs(title = "MSRP - TDP",
        x = "MSRP (USD)",
        y = "TDP (W)",
        color = "Generation")


ggsave("plot\\NVIDIA\\nvMSRPtoTransistors.png", nvMSRPtoTransistors, width = 10, height = 12)
ggsave("plot\\NVIDIA\\nvMSRPtoVRAM.png", nvMSRPtoVRAM, width = 10, height = 12)
ggsave("plot\\NVIDIA\\nvMSRPtoSP.png", nvMSRPtoSP, width = 10, height = 12)
ggsave("plot\\NVIDIA\\nvMSRPtoTMU.png", nvMSRPtoTMU, width = 10, height = 12)
ggsave("plot\\NVIDIA\\nvMSRPtoROP.png", nvMSRPtoROP, width = 10, height = 12)
ggsave("plot\\NVIDIA\\nvMSRPtoConfig.png", nvMSRPtoConfig, width = 10, height = 12)
ggsave("plot\\NVIDIA\\nvMSRPtoFP16.png", nvMSRPtoFP16, width = 10, height = 12)
ggsave("plot\\NVIDIA\\nvMSRPtoTDP.png", nvMSRPtoTDP, width = 10, height = 12)


nvGentoScore <- ggplot(df.nvidia, aes(x = Generation, y = Score, color = Generation)) +
    geom_point() +
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    scale_y_continuous(breaks = seq(0, 20000, by=1000)) +
    labs(title = "Generation - Score",
         x = "Generation",
         y = "Score",
         color = "Generation")

nvGentoFP16 <- ggplot(df.nvidia, aes(x = Generation, y = FP16, color = Generation)) +
    geom_point() +
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    scale_y_continuous(breaks = seq(0, 120, by=5)) +
    labs(title = "Generation - FP16",
         x = "Generation",
         y = "FP16 (TFLOPS)",
         color = "Generation")

nvGentoTDP <- ggplot(df.nvidia, aes(x = Generation, y = TDP, color = Generation)) +
    geom_point() +
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    scale_y_continuous(breaks = seq(0, 1000, by=25)) +
    labs(title = "Generation - TDP",
         x = "Generation",
         y = "TDP (W)",
         color = "Generation")

nvGentoVRAM <- ggplot(df.nvidia, aes(x = Generation, y = VRAM, color = Generation)) +
    geom_point() +
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    scale_y_continuous(breaks = c(seq(4, 24, by=4),6,32)) +
    labs(title = "Generation - VRAM",
         x = "Generation",
         y = "VRAM (GB)",
         color = "Generation")

nvGentoTransistors <- ggplot(df.nvidia, aes(x = Generation, y = Transistors, color = Generation)) +
    geom_point() +
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    scale_y_continuous(breaks = seq(0,200, by=5)) +
    labs(title= "Generation - Transistors",
         x = "Generation",
         y = "Transistors (B)",
         color = "Generation")

nvGentoConfig <- ggplot(df.nvidia, aes(x = Generation, y = Config, color = Generation)) +
    geom_point() +
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    labs(title = "Generation - Config",
         x = "Generation",
         y = "Config",
         color = "Generation")

ggsave("plot\\NVIDIA\\nvGentoScore.png", nvGentoScore, width = 10, height = 12)
ggsave("plot\\NVIDIA\\nvGentoFP16.png", nvGentoFP16, width = 10, height = 12)
ggsave("plot\\NVIDIA\\nvGentoTDP.png", nvGentoTDP, width = 10, height = 12)
ggsave("plot\\NVIDIA\\nvGentoVRAM.png", nvGentoVRAM, width = 10, height = 12)
ggsave("plot\\NVIDIA\\nvGentoTransistors.png", nvGentoTransistors, width = 10, height = 12)
ggsave("plot\\NVIDIA\\nvGentoConfig.png", nvGentoConfig, width = 10, height = 12)



print("Nvidia Complete")
print("Plots Saved to plot/nvidia")


#intel

print("Intel Start")

df.intel$Generation <- as.factor(df.intel$Generation)

intelSP <- ggplot(df.intel, aes(x = SP, y = Score, color = Generation)) +
    geom_point()+
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, alpha = 0.2, linewidth = 0.5, aes(group = Generation)) +
    labs(title = "SP - Score",
         x = "SP",
         y = "Score",
         color = "Generation")

intelTMU <- ggplot(df.intel, aes(x = TMU, y = Score, color = Generation)) +
    geom_point()+
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, alpha = 0.2, linewidth = 0.5, aes(group = Generation)) +
    labs(title = "TMU - Score",
         x = "TMU",
         y = "Score",
         color = "Generation")

intelROP <- ggplot(df.intel, aes(x = ROP, y = Score, color = Generation)) +
    geom_point()+
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, alpha = 0.2, linewidth = 0.5, aes(group = Generation)) +
    labs(title = "ROP - Score",
         x = "ROP",
         y = "Score",
         color = "Generation")

intelMSRP <- ggplot(df.intel, aes(x = MSRP, y = Score, color = Generation)) +
    geom_point()+
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, alpha = 0.2, linewidth = 0.5, aes(group = Generation)) +
    scale_x_continuous(breaks = c(180, 220, 250, 290, 330)) +
    labs(title = "MSRP - Score",
         x = "MSRP (USD)",
         y = "Score",
         color = "Generation")

intelTransistors <- ggplot(df.intel, aes(x = Transistors, y = Score, color = Generation)) +
    geom_point()+
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, alpha = 0.2, linewidth = 0.5, aes(group = Generation)) +
    labs(title = "Transistors - Score",
         x = "Transistors (B)",
         y = "Score",
         color = "Generation")

intelConfig <- ggplot(df.intel, aes(x = Config, y = Score, color = Generation)) +
    geom_point()+
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, alpha = 0.2, linewidth = 0.5, aes(group = Generation)) +
    labs(title = "Config - Score",
         x = "Config",
         y = "Score",
         color = "Generation")

intelFP16 <- ggplot(df.intel, aes(x = FP16, y = Score, color = Generation))+
    geom_point()+
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, alpha = 0.2, linewidth = 0.5, aes(group = Generation)) +
    labs(title = "FP16 - Score",
         x = "FP16 (TFLOPS)",
         y = "Score",
         color = "Generation")

intelTDP <- ggplot(df.intel, aes(x = TDP, y = Score, color = Generation))+
    geom_point()+
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    scale_x_continuous(breaks = seq(0, 1000, by=25)) +
    geom_smooth(method = "lm", se = FALSE, alpha = 0.2, linewidth = 0.5, aes(group = Generation)) +
    labs(title = "TDP - Score",
         x = "TDP (W)",
         y = "Score",
         color = "Generation")


ggsave("plot\\Intel\\intelSP.png", intelSP, width = 10, height = 12)
ggsave("plot\\Intel\\intelTMU.png", intelTMU, width = 10, height = 12)
ggsave("plot\\Intel\\intelROP.png", intelROP, width = 10, height = 12)
ggsave("plot\\Intel\\intelMSRP.png", intelMSRP, width = 10, height = 12)
ggsave("plot\\Intel\\intelTransistors.png", intelTransistors, width = 10, height = 12)
ggsave("plot\\Intel\\intelConfig.png", intelConfig, width = 10, height = 12)
ggsave("plot\\Intel\\intelFP16.png", intelFP16, width = 10, height = 12)
ggsave("plot\\Intel\\intelTDP.png", intelTDP, width = 10, height = 12)

intelMSRPtoTransistors <- ggplot(df.intel, aes(x = MSRP, y = Transistors, color = Generation)) +
    geom_point()+
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, alpha = 0.2, linewidth = 0.5, aes(group = Generation)) +
    scale_x_continuous(breaks = c(180, 220, 250, 290, 330)) +
    scale_y_continuous(breaks = seq(0,200, by=5)) +
    labs(title = "MSRP - Transistors",
         x = "MSRP (USD)",
         y = "Transistors (B)",
         color = "Generation")

intelMSRPtoVRAM <- ggplot(df.intel, aes(x = MSRP, y = VRAM, color = Generation)) +
    geom_point()+
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, alpha = 0.2, linewidth = 0.5, aes(group = Generation)) +
    scale_y_continuous(breaks = c(6, 8, 10, 12)) +
    scale_x_continuous(breaks = c(180, 220, 250, 290, 330)) +
    labs(title = "MSRP - VRAM",
         x = "MSRP (USD)",
         y = "VRAM (GB)",
         color = "Generation")

intelMSRPtoSP <- ggplot(df.intel, aes(x = MSRP, y = SP, color = Generation)) +
    geom_point()+
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, alpha = 0.2, linewidth = 0.5, aes(group = Generation)) +
    scale_x_continuous(breaks = c(180, 220, 250, 290, 330)) +
    labs(title = "MSRP - SP",
         x = "MSRP (USD)",
         y = "SP",
         color = "Generation")

intelMSRPtoTMU <- ggplot(df.intel, aes(x = MSRP, y = TMU, color = Generation)) +
    geom_point()+
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, alpha = 0.2, linewidth = 0.5, aes(group = Generation)) +
    scale_x_continuous(breaks = c(180, 220, 250, 290, 330)) +
    labs(title = "MSRP - TMU",
         x = "MSRP (USD)",
         y = "TMU",
         color = "Generation")

intelMSRPtoROP <- ggplot(df.intel, aes(x = MSRP, y = ROP, color = Generation)) +
    geom_point()+
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, alpha = 0.2, linewidth = 0.5, aes(group = Generation)) +
    scale_x_continuous(breaks = c(180, 220, 250, 290, 330)) +
    labs(title = "MSRP - ROP",
         x = "MSRP (USD)",
         y = "ROP",
         color = "Generation")

intelMSRPtoConfig <- ggplot(df.intel, aes(x = MSRP, y = Config, color = Generation)) +
    geom_point()+
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, alpha = 0.2, linewidth = 0.5, aes(group = Generation)) +
    scale_x_continuous(breaks = c(180, 220, 250, 290, 330)) +
    labs(title = "MSRP - Config",
         x = "MSRP (USD)",
         y = "Config",
         color = "Generation")

intelMSRPtoFP16 <- ggplot(df.intel, aes(x = MSRP, y = FP16, color = Generation)) +
    geom_point()+
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, alpha = 0.2, linewidth = 0.5, aes(group = Generation)) +
    scale_x_continuous(breaks = c(180, 220, 250, 290, 330)) +
    scale_y_continuous(breaks = seq(0, 120, by=5)) +
    labs(title = "MSRP - FP16",
         x = "MSRP (USD)",
         y = "FP16 (TFLOPS)",
         color = "Generation")

intelMSRPtoTDP <- ggplot(df.intel, aes(x = MSRP, y = TDP, color = Generation)) +
    geom_point()+
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, alpha = 0.2, linewidth = 0.5, aes(group = Generation)) +
    scale_x_continuous(breaks = c(180, 220, 250, 290, 330)) +
    scale_y_continuous(breaks = seq(0, 1000, by=25)) +
    labs(title = "MSRP - TDP",
         x = "MSRP (USD)",
         y = "TDP (W)",
         color = "Generation")


ggsave("plot\\Intel\\intelMSRPtoTransistors.png", intelMSRPtoTransistors, width = 10, height = 12)
ggsave("plot\\Intel\\intelMSRPtoVRAM.png", intelMSRPtoVRAM, width = 10, height = 12)
ggsave("plot\\Intel\\intelMSRPtoSP.png", intelMSRPtoSP, width = 10, height = 12)
ggsave("plot\\Intel\\intelMSRPtoTMU.png", intelMSRPtoTMU, width = 10, height = 12)
ggsave("plot\\Intel\\intelMSRPtoROP.png", intelMSRPtoROP, width = 10, height = 12)
ggsave("plot\\Intel\\intelMSRPtoConfig.png", intelMSRPtoConfig, width = 10, height = 12)
ggsave("plot\\Intel\\intelMSRPtoFP16.png", intelMSRPtoFP16, width = 10, height = 12)
ggsave("plot\\Intel\\intelMSRPtoTDP.png", intelMSRPtoTDP, width = 10, height = 12)


intelGentoScore <- ggplot(df.intel, aes(x = Generation, y = Score, color = Generation)) +
    geom_point() +
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    scale_y_continuous(breaks = seq(0, 20000, by=1000)) +
    labs(title = "Generation - Score",
         x = "Generation",
         y = "Score",
         color = "Generation")

intelGentoFP16 <- ggplot(df.intel, aes(x = Generation, y = FP16, color = Generation)) +
    geom_point() +
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    scale_y_continuous(breaks = seq(0, 120, by=5)) +
    labs(title = "Generation - FP16",
         x = "Generation",
         y = "FP16 (TFLOPS)",
         color = "Generation")

intelGentoTDP <- ggplot(df.intel, aes(x = Generation, y = TDP, color = Generation)) +
    geom_point() +
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    scale_y_continuous(breaks = seq(0, 1000, by=25)) +
    labs(title = "Generation - TDP",
         x = "Generation",
         y = "TDP (W)",
         color = "Generation")

intelGentoVRAM <- ggplot(df.intel, aes(x = Generation, y = VRAM, color = Generation)) +
    geom_point() +
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    scale_y_continuous(breaks = c(seq(4, 24, by=4),6,10,32)) +
    labs(title = "Generation - VRAM",
         x = "Generation",
         y = "VRAM (GB)",
         color = "Generation")

intelGentoTransistors <- ggplot(df.intel, aes(x = Generation, y = Transistors, color = Generation)) +
    geom_point() +
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    scale_y_continuous(breaks = seq(0,200, by=5)) +
    labs(title= "Generation - Transistors",
         x = "Generation",
         y = "Transistors (B)",
         color = "Generation")

intelGentoConfig <- ggplot(df.intel, aes(x = Generation, y = Config, color = Generation)) +
    geom_point() +
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    labs(title = "Generation - Config",
         x = "Generation",
         y = "Config",
         color = "Generation")

ggsave("plot\\Intel\\intelGentoScore.png", intelGentoScore, width = 10, height = 12)
ggsave("plot\\Intel\\intelGentoFP16.png", intelGentoFP16, width = 10, height = 12)
ggsave("plot\\Intel\\intelGentoTDP.png", intelGentoTDP, width = 10, height = 12)
ggsave("plot\\Intel\\intelGentoVRAM.png", intelGentoVRAM, width = 10, height = 12)
ggsave("plot\\Intel\\intelGentoTransistors.png", intelGentoTransistors, width = 10, height = 12)
ggsave("plot\\Intel\\intelGentoConfig.png", intelGentoConfig, width = 10, height = 12)




print("Intel Complete")
print("Plots Saved to plot/Intel")


#amd

print("AMD Start")

df.amd$Generation <- as.factor(df.amd$Generation)

amdSP <- ggplot(df.amd, aes(x = SP, y = Score, color = Generation)) +
    geom_point()+
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, alpha = 0.2, linewidth = 0.5, aes(group = Generation)) +
    labs(title = "SP - Score",
         x = "SP",
         y = "Score",
         color = "Generation")

amdTMU <- ggplot(df.amd, aes(x = TMU, y = Score, color = Generation)) +
    geom_point()+
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, alpha = 0.2, linewidth = 0.5, aes(group = Generation)) +
    labs(title = "TMU - Score",
         x = "TMU",
         y = "Score",
         color = "Generation")

amdROP <- ggplot(df.amd, aes(x = ROP, y = Score, color = Generation)) +
    geom_point()+
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, alpha = 0.2, linewidth = 0.5, aes(group = Generation)) +
    labs(title = "ROP - Score",
         x = "ROP",
         y = "Score",
         color = "Generation")

amdMSRP <- ggplot(df.amd, aes(x = MSRP, y = Score, color = Generation)) +
    geom_point()+
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, alpha = 0.2, linewidth = 0.5, aes(group = Generation)) +
    scale_x_continuous(breaks = c(seq(200, 1000, by = 200), 1100)) +
    labs(title = "MSRP - Score",
         x = "MSRP (USD)",
         y = "Score",
         color = "Generation")

amdTransistors <- ggplot(df.amd, aes(x = Transistors, y = Score, color = Generation)) +
    geom_point()+
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, alpha = 0.2, linewidth = 0.5, aes(group = Generation)) +
    labs(title = "Transistors - Score",
         x = "Transistors (B)",
         y = "Score",
         color = "Generation")

amdConfig <- ggplot(df.amd, aes(x = Config, y = Score, color = Generation)) +
    geom_point()+
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, alpha = 0.2, linewidth = 0.5, aes(group = Generation)) +
    labs(title = "Config - Score",
         x = "Config",
         y = "Score",
         color = "Generation")

amdFP16 <- ggplot(df.amd, aes(x = FP16, y = Score, color = Generation))+
    geom_point()+
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, alpha = 0.2, linewidth = 0.5, aes(group = Generation)) +
    labs(title = "FP16 - Score",
         x = "FP16 (TFLOPS)",
         y = "Score",
         color = "Generation")

amdTDP <- ggplot(df.amd, aes(x = TDP, y = Score, color = Generation))+
    geom_point()+
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    scale_x_continuous(breaks = seq(0, 1000, by=25)) +
    geom_smooth(method = "lm", se = FALSE, alpha = 0.2, linewidth = 0.5, aes(group = Generation)) +
    labs(title = "TDP - Score",
         x = "TDP (W)",
         y = "Score",
         color = "Generation")

ggsave("plot\\AMD\\amdSP.png", amdSP, width = 10, height = 12)
ggsave("plot\\AMD\\amdTMU.png", amdTMU, width = 10, height = 12)
ggsave("plot\\AMD\\amdROP.png", amdROP, width = 10, height = 12)
ggsave("plot\\AMD\\amdMSRP.png", amdMSRP, width = 10, height = 12)
ggsave("plot\\AMD\\amdTransistors.png", amdTransistors, width = 10, height = 12)
ggsave("plot\\AMD\\amdConfig.png", amdConfig, width = 10, height = 12)
ggsave("plot\\AMD\\amdFP16.png", amdFP16, width = 10, height = 12)
ggsave("plot\\AMD\\amdTDP.png", amdTDP, width = 10, height = 12)


amdMSRPtoTransistors <- ggplot(df.amd, aes(x = MSRP, y = Transistors, color = Generation)) +
    geom_point()+
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, alpha = 0.2, linewidth = 0.5, aes(group = Generation)) +
    scale_x_continuous(breaks = c(seq(200, 1000, by = 200), 1100)) +
    scale_y_continuous(breaks = seq(0,200, by=5)) +
    labs(title = "MSRP - Transistors",
         x = "MSRP (USD)",
         y = "Transistors (B)",
         color = "Generation")

amdMSRPtoVRAM <- ggplot(df.amd, aes(x = MSRP, y = VRAM, color = Generation)) +
    geom_point()+
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, alpha = 0.2, linewidth = 0.5, aes(group = Generation)) +
    scale_y_continuous(breaks = c(4, 6, 8, 12, 16, 20, 24)) +
    scale_x_continuous(breaks = c(seq(200, 1000, by = 200), 1100)) +
    labs(title = "MSRP - VRAM",
         x = "MSRP (USD)",
         y = "VRAM (GB)",
         color = "Generation")

amdMSRPtoSP <- ggplot(df.amd, aes(x = MSRP, y = SP, color = Generation)) +
    geom_point()+
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, alpha = 0.2, linewidth = 0.5, aes(group = Generation)) +
    scale_x_continuous(breaks = c(seq(200, 1000, by = 200), 1100)) +
    labs(title = "MSRP - SP",
         x = "MSRP (USD)",
         y = "SP",
         color = "Generation")

amdMSRPtoTMU <- ggplot(df.amd, aes(x = MSRP, y = TMU, color = Generation)) +
    geom_point()+
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, alpha = 0.2, linewidth = 0.5, aes(group = Generation)) +
    scale_x_continuous(breaks = c(seq(200, 1000, by = 200), 1100)) +
    labs(title = "MSRP - TMU",
         x = "MSRP (USD)",
         y = "TMU",
         color = "Generation")

amdMSRPtoROP <- ggplot(df.amd, aes(x = MSRP, y = ROP, color = Generation)) +
    geom_point()+
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, alpha = 0.2, linewidth = 0.5, aes(group = Generation)) +
    scale_x_continuous(breaks = c(seq(200, 1000, by = 200), 1100)) +
    labs(title = "MSRP - ROP",
         x = "MSRP (USD)",
         y = "ROP",
         color = "Generation")

amdMSRPtoConfig <- ggplot(df.amd, aes(x = MSRP, y = Config, color = Generation)) +
    geom_point()+
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, alpha = 0.2, linewidth = 0.5, aes(group = Generation)) +
    scale_x_continuous(breaks = c(seq(200, 1000, by = 200), 1100)) +
    labs(title = "MSRP - Config",
         x = "MSRP (USD)",
         y = "Config",
         color = "Generation")

amdMSRPtoFP16 <- ggplot(df.amd, aes(x = MSRP, y = FP16, color = Generation)) +
    geom_point()+
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, alpha = 0.2, linewidth = 0.5, aes(group = Generation)) +
    scale_x_continuous(breaks = c(seq(200, 1000, by = 200), 1100)) +
    scale_y_continuous(breaks = seq(0, 120, by=5)) +
    labs(title = "MSRP - FP16",
         x = "MSRP (USD)",
         y = "FP16 (TFLOPS)",
         color = "Generation")

amdMSRPtoTDP <- ggplot(df.amd, aes(x = MSRP, y = TDP, color = Generation)) +
    geom_point()+
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    geom_smooth(method = "lm", se = FALSE, alpha = 0.2, linewidth = 0.5, aes(group = Generation)) +
    scale_x_continuous(breaks = c(seq(200, 1000, by = 200), 1100)) +
    scale_y_continuous(breaks = seq(0, 1000, by=25)) +
    labs(title = "MSRP - TDP",
         x = "MSRP (USD)",
         y = "TDP (W)",
         color = "Generation")


ggsave("plot\\AMD\\amdMSRPtoTransistors.png", amdMSRPtoTransistors, width = 10, height = 12)
ggsave("plot\\AMD\\amdMSRPtoVRAM.png", amdMSRPtoVRAM, width = 10, height = 12)
ggsave("plot\\AMD\\amdMSRPtoSP.png", amdMSRPtoSP, width = 10, height = 12)
ggsave("plot\\AMD\\amdMSRPtoTMU.png", amdMSRPtoTMU, width = 10, height = 12)
ggsave("plot\\AMD\\amdMSRPtoROP.png", amdMSRPtoROP, width = 10, height = 12)
ggsave("plot\\AMD\\amdMSRPtoConfig.png", amdMSRPtoConfig, width = 10, height = 12)
ggsave("plot\\AMD\\amdMSRPtoFP16.png", amdMSRPtoFP16, width = 10, height = 12)
ggsave("plot\\AMD\\amdMSRPtoTDP.png", amdMSRPtoTDP, width = 10, height = 12)




amdGentoScore <- ggplot(df.amd, aes(x = Generation, y = Score, color = Generation)) +
    geom_point() +
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    scale_y_continuous(breaks = seq(0, 20000, by=1000)) +
    labs(title = "Generation - Score",
         x = "Generation",
         y = "Score",
         color = "Generation")

amdGentoFP16 <- ggplot(df.amd, aes(x = Generation, y = FP16, color = Generation)) +
    geom_point() +
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    scale_y_continuous(breaks = seq(0, 120, by=5)) +
    labs(title = "Generation - FP16",
         x = "Generation",
         y = "FP16 (TFLOPS)",
         color = "Generation")

amdGentoTDP <- ggplot(df.amd, aes(x = Generation, y = TDP, color = Generation)) +
    geom_point() +
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    scale_y_continuous(breaks = seq(0, 1000, by=25)) +
    labs(title = "Generation - TDP",
         x = "Generation",
         y = "TDP (W)",
         color = "Generation")

amdGentoVRAM <- ggplot(df.amd, aes(x = Generation, y = VRAM, color = Generation)) +
    geom_point() +
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    scale_y_continuous(breaks = c(seq(4, 24, by=4),6,10,32)) +
    labs(title = "Generation - VRAM",
         x = "Generation",
         y = "VRAM (GB)",
         color = "Generation")

amdGentoTransistors <- ggplot(df.amd, aes(x = Generation, y = Transistors, color = Generation)) +
    geom_point() +
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    scale_y_continuous(breaks = seq(0,200, by=5)) +
    labs(title= "Generation - Transistors",
         x = "Generation",
         y = "Transistors (B)",
         color = "Generation")

amdGentoConfig <- ggplot(df.amd, aes(x = Generation, y = Config, color = Generation)) +
    geom_point() +
    geom_text_repel(aes(label = GPU),
                    size = 4,
                    max.overlaps = Inf,
                    box.padding = 1.2,
                    segment.color = "#90888895") +
    labs(title = "Generation - Config",
         x = "Generation",
         y = "Config",
         color = "Generation")

ggsave("plot\\AMD\\amdGentoScore.png", amdGentoScore, width = 10, height = 12)
ggsave("plot\\AMD\\amdGentoFP16.png", amdGentoFP16, width = 10, height = 12)
ggsave("plot\\AMD\\amdGentoTDP.png", amdGentoTDP, width = 10, height = 12)
ggsave("plot\\AMD\\amdGentoVRAM.png", amdGentoVRAM, width = 10, height = 12)
ggsave("plot\\AMD\\amdGentoTransistors.png", amdGentoTransistors, width = 10, height = 12)
ggsave("plot\\AMD\\amdGentoConfig.png", amdGentoConfig, width = 10, height = 12)





print("AMD Complete")
print("Plots Saved to plot/AMD")

#universal comparisons

print("Starting Brand Comparisons")

#2025GPU
print("2025GPU Start")
nv50sub<-subset(df.nvidia, Generation == "50")
amd9000sub<-subset(df.amd, Generation == "9000")
intelBsub<-subset(df.intel, Generation == "B")
if (nrow(nv50sub) > 0) {
  nv50sub$Brand <- "Nvidia"
} else {
  nv50sub$Brand <- character(0)
}
if (nrow(amd9000sub) > 0) {
  amd9000sub$Brand <- "AMD"
} else {
  amd9000sub$Brand <- character(0)
}
if (nrow(intelBsub) > 0) {
  intelBsub$Brand <- "Intel"
} else {
  intelBsub$Brand <- character(0)
}
c25Sub<-rbind(nv50sub, amd9000sub, intelBsub)
c25ScorePlot<-ggplot(c25Sub, aes(x=MSRP, y=Score, color=Brand))+
    geom_point()+
    geom_text_repel(aes(label=GPU),
                    size=4,
                    max.overlaps=Inf,
                    box.padding=1.2,
                    segment.color="#90888895")+
    geom_smooth(method="lm", se=FALSE, aes(group=Brand))+
    scale_x_continuous(breaks=seq(200, 2000, by=100))+
    scale_y_continuous(breaks=seq(0, 14000, by=1000))+
    scale_color_manual(values=c("AMD"="#ED1C24", "Intel"="#0071C5", "Nvidia"="#76B900"))+
    labs(title="MSRP - Score : 2025 GPU",
         x="MSRP (USD)",
         y="Score",
         color="Brand")

c25VRAMPlot<-ggplot(c25Sub, aes(x=MSRP, y=VRAM, color=Brand))+
    geom_point()+
    geom_text_repel(aes(label=GPU),
                    size=4,
                    max.overlaps=Inf,
                    box.padding=1.2,
                    segment.color="#90888895")+
    scale_y_continuous(breaks=c(10, 12, 16))+
    scale_x_continuous(breaks=seq(200, 2000, by=100))+
    scale_color_manual(values=c("AMD"="#ED1C24", "Intel"="#0071C5", "Nvidia"="#76B900"))+
    labs(title="MSRP - VRAM : 2025 GPU",
         x="MSRP (USD)",
         y="VRAM (GB)",
         color="Brand")

c25GentoScorePlot<-ggplot(c25Sub, aes(x=Generation, y=Score, color=Brand))+
    geom_point()+
    geom_text_repel(aes(label=GPU),
                    size=4,
                    max.overlaps=Inf,
                    box.padding=1.2,
                    segment.color="#90888895")+
    geom_smooth(method="lm", se=FALSE, aes(group=Brand))+
    scale_y_continuous(breaks=seq(0, 14000, by=1000))+
    labs(title="Generation - Score : 2025 GPU",
         x="Generation",
         y="Score",
         color="Brand")

c25GentoFP16 <- ggplot(c25Sub, aes(x=Generation, y=FP16, color=Brand))+
    geom_point()+
    geom_text_repel(aes(label=GPU),
                    size=4,
                    max.overlaps=Inf,
                    box.padding=1.2,
                    segment.color="#90888895")+
    geom_smooth(method="lm", se=FALSE, aes(group=Brand))+
    scale_y_continuous(breaks=seq(0, 120, by=5))+
    labs(title="Generation - FP16 : 2025 GPU",
         x="Generation",
         y="FP16 (TFLOPS)",
         color="Brand")

c25GentoTDP <- ggplot(c25Sub, aes(x=Generation, y=TDP, color=Brand))+
    geom_point()+
    geom_text_repel(aes(label=GPU),
                    size=4,
                    max.overlaps=Inf,
                    box.padding=1.2,
                    segment.color="#90888895")+
    geom_smooth(method="lm", se=FALSE, aes(group=Brand))+
    scale_y_continuous(breaks=seq(0, 1000, by=25))+
    labs(title="Generation - TDP : 2025 GPU",
         x="Generation",
         y="TDP (W)",
         color="Brand")

c25GentoVRAM <- ggplot(c25Sub, aes(x=Generation, y=VRAM, color=Brand))+
    geom_point()+
    geom_text_repel(aes(label=GPU),
                    size=4,
                    max.overlaps=Inf,
                    box.padding=1.2,
                    segment.color="#90888895")+
    scale_y_continuous(breaks=c(10, 12, 16))+
    labs(title="Generation - VRAM : 2025 GPU",
         x="Generation",
         y="VRAM (GB)",
         color="Brand")

c25GentoTransistors <- ggplot(c25Sub, aes(x=Generation, y=Transistors, color=Brand))+
    geom_point()+
    geom_text_repel(aes(label=GPU),
                    size=4,
                    max.overlaps=Inf,
                    box.padding=1.2,
                    segment.color="#90888895")+
    scale_y_continuous(breaks = seq(0,200, by=5)) +
    labs(title="Generation - Transistors : 2025 GPU",
         x="Generation",
         y="Transistors (B)",
         color="Brand")


c25GentoConfig <- ggplot(c25Sub, aes(x=Generation, y=Config, color=Brand))+
    geom_point()+
    geom_text_repel(aes(label=GPU),
                    size=4,
                    max.overlaps=Inf,
                    box.padding=1.2,
                    segment.color="#90888895")+
    labs(title="Generation - Config : 2025 GPU",
         x="Generation",
         y="Config",
         color="Brand")



ggsave("plot\\Universal\\2025GPU\\2025ScorePlot.png", c25ScorePlot, width=10, height=12)
ggsave("plot\\Universal\\2025GPU\\2025VRAMPlot.png", c25VRAMPlot, width=10, height=12)
ggsave("plot\\Universal\\2025GPU\\2025GentoScorePlot.png", c25GentoScorePlot, width=10, height=12)
ggsave("plot\\Universal\\2025GPU\\2025GentoFP16.png", c25GentoFP16, width=10, height=12)
ggsave("plot\\Universal\\2025GPU\\2025GentoTDP.png", c25GentoTDP, width=10, height=12)
ggsave("plot\\Universal\\2025GPU\\2025GentoVRAM.png", c25GentoVRAM, width=10, height=12)
ggsave("plot\\Universal\\2025GPU\\2025GentoTransistors.png", c25GentoTransistors, width=10, height=12)
ggsave("plot\\Universal\\2025GPU\\2025GentoConfig.png", c25GentoConfig, width=10, height=12)


print("2025GPU Complete")
print("Plots Saved to plot\\Universal\\2025GPU")

#2022-2024GPU
print("2022-2024GPU Start")
nv40sub<-subset(df.nvidia, Generation == "40")
amd7000sub<-subset(df.amd, Generation == "7000")
intelAsub<-subset(df.intel, Generation == "A")

if(nrow(nv40sub) > 0){
    nv40sub$Brand <- "Nvidia"
} else {
    nv40sub$Brand <- character(0)
}
if(nrow(amd7000sub) > 0){
    amd7000sub$Brand <- "AMD"
} else {
    amd7000sub$Brand <- character(0)
}
if(nrow(intelAsub) > 0){
    intelAsub$Brand <- "Intel"
} else {
    intelAsub$Brand <- character(0)
}

c22Sub<-rbind(nv40sub, amd7000sub, intelAsub)
c22ScorePlot<-ggplot(c22Sub, aes(x=MSRP, y=Score, color=Brand))+
    geom_point()+
    geom_text_repel(aes(label=GPU),
                    size=4,
                    max.overlaps=Inf,
                    box.padding=1.2,
                    segment.color="#90888895")+
    geom_smooth(method="lm", se=FALSE, aes(group=Brand))+
    scale_x_continuous(breaks=seq(200, 2000, by=100))+
    scale_y_continuous(breaks=seq(0, 10000, by=500))+
    scale_color_manual(values=c("AMD"="#ED1C24", "Intel"="#0071C5", "Nvidia"="#76B900"))+
    labs(title="MSRP - Score : 2022-2024 GPU",
         x="MSRP (USD)",
         y="Score",
         color="Brand")

c22VRAMPlot<-ggplot(c22Sub, aes(x=MSRP, y=VRAM, color=Brand))+
    geom_point()+
    geom_text_repel(aes(label=GPU),
                    size=4,
                    max.overlaps=Inf,
                    box.padding=1.2,
                    segment.color="#90888895")+
    scale_y_continuous(breaks=seq(8, 24, by=4))+
    scale_x_continuous(breaks=seq(200, 2000, by=100))+
    scale_color_manual(values=c("AMD"="#ED1C24", "Intel"="#0071C5", "Nvidia"="#76B900"))+
    labs(title="MSRP - VRAM : 2022-2024 GPU",
         x="MSRP (USD)",
         y="VRAM (GB)",
         color="Brand")

c22GentoScorePlot<-ggplot(c22Sub, aes(x=Generation, y=Score, color=Brand))+
    geom_point()+
    geom_text_repel(aes(label=GPU),
                    size=4,
                    max.overlaps=Inf,
                    box.padding=1.2,
                    segment.color="#90888895")+
    geom_smooth(method="lm", se=FALSE, aes(group=Brand))+
    scale_y_continuous(breaks=seq(0, 10000, by=500))+
    labs(title="Generation - Score : 2022-2024 GPU",
         x="Generation",
         y="Score",
         color="Brand")

c22GentoFP16 <- ggplot(c22Sub, aes(x=Generation, y=FP16, color=Brand))+
    geom_point()+
    geom_text_repel(aes(label=GPU),
                    size=4,
                    max.overlaps=Inf,
                    box.padding=1.2,
                    segment.color="#90888895")+
    geom_smooth(method="lm", se=FALSE, aes(group=Brand))+
    scale_y_continuous(breaks=seq(0, 120, by=5))+
    labs(title="Generation - FP16 : 2022-2024 GPU",
         x="Generation",
         y="FP16 (TFLOPS)",
         color="Brand")

c22GentoTDP <- ggplot(c22Sub, aes(x=Generation, y=TDP, color=Brand))+
    geom_point()+
    geom_text_repel(aes(label=GPU),
                    size=4,
                    max.overlaps=Inf,
                    box.padding=1.2,
                    segment.color="#90888895")+
    geom_smooth(method="lm", se=FALSE, aes(group=Brand))+
    scale_y_continuous(breaks=seq(0, 1000, by=25))+
    labs(title="Generation - TDP : 2022-2024 GPU",
         x="Generation",
         y="TDP (W)",
         color="Brand")

c22GentoVRAM <- ggplot(c22Sub, aes(x=Generation, y=VRAM, color=Brand))+
    geom_point()+
    geom_text_repel(aes(label=GPU),
                    size=4,
                    max.overlaps=Inf,
                    box.padding=1.2,
                    segment.color="#90888895")+
    scale_y_continuous(breaks=seq(8, 24, by=4))+
    labs(title="Generation - VRAM : 2022-2024 GPU",
         x="Generation",
         y="VRAM (GB)",
         color="Brand")

c22GentoTransistors <- ggplot(c22Sub, aes(x=Generation, y=Transistors, color=Brand))+
    geom_point()+
    geom_text_repel(aes(label=GPU),
                    size=4,
                    max.overlaps=Inf,
                    box.padding=1.2,
                    segment.color="#90888895")+
    scale_y_continuous(breaks = seq(0,200, by=5)) +
    labs(title="Generation - Transistors : 2022-2024 GPU",
         x="Generation",
         y="Transistors (B)",
         color="Brand")

c22GentoConfig <- ggplot(c22Sub, aes(x=Generation, y=Config, color=Brand))+
    geom_point()+
    geom_text_repel(aes(label=GPU),
                    size=4,
                    max.overlaps=Inf,
                    box.padding=1.2,
                    segment.color="#90888895")+
    labs(title="Generation - Config : 2022-2024 GPU",
         x="Generation",
         y="Config",
         color="Brand")

         
ggsave("plot\\Universal\\2022-2024GPU\\2022-2024ScorePlot.png", c22ScorePlot, width=10, height=12)
ggsave("plot\\Universal\\2022-2024GPU\\2022-2024VRAMPlot.png", c22VRAMPlot, width=10, height=12)
ggsave("plot\\Universal\\2022-2024GPU\\2022-2024GentoScorePlot.png", c22GentoScorePlot, width=10, height=12)
ggsave("plot\\Universal\\2022-2024GPU\\2022-2024GentoFP16.png", c22GentoFP16, width=10, height=12)
ggsave("plot\\Universal\\2022-2024GPU\\2022-2024GentoTDP.png", c22GentoTDP, width=10, height=12)
ggsave("plot\\Universal\\2022-2024GPU\\2022-2024GentoVRAM.png", c22GentoVRAM, width=10, height=12)
ggsave("plot\\Universal\\2022-2024GPU\\2022-2024GentoTransistors.png", c22GentoTransistors, width=10, height=12)
ggsave("plot\\Universal\\2022-2024GPU\\2022-2024GentoConfig.png", c22GentoConfig, width=10, height=12)


print("2022-2024GPU Complete")
print("Plots Saved to plot\\Universal\\2022-2024GPU")

#2020-2022GPU
print("2020-2022GPU Start")
nv30sub<-subset(df.nvidia, Generation == "30")
amd6000sub<-subset(df.amd, Generation == "6000")

if(nrow(nv30sub) > 0){
    nv30sub$Brand <- "Nvidia"
} else {
    nv30sub$Brand <- character(0)
}
if(nrow(amd6000sub) > 0){
    amd6000sub$Brand <- "AMD"
} else {
    amd6000sub$Brand <- character(0)
}

c20Sub<-rbind(nv30sub, amd6000sub)
c20ScorePlot<-ggplot(c20Sub, aes(x=MSRP, y=Score, color=Brand))+
    geom_point()+
    geom_text_repel(aes(label=GPU),
                    size=4,
                    max.overlaps=Inf,
                    box.padding=1.2,
                    segment.color="#90888895")+
    geom_smooth(method="lm", se=FALSE, aes(group=Brand))+
    scale_x_continuous(breaks=seq(200, 2000, by=100))+
    scale_y_continuous(breaks=seq(0, 8000, by=500))+
    scale_color_manual(values=c("AMD"="#ED1C24", "Nvidia"="#76B900"))+
    labs(title="MSRP - Score : 2020-2022 GPU",
         x="MSRP (USD)",
         y="Score",
         color="Brand")

c20VRAMPlot<-ggplot(c20Sub, aes(x=MSRP, y=VRAM, color=Brand))+
    geom_point()+
    geom_text_repel(aes(label=GPU),
                    size=4,
                    max.overlaps=Inf,
                    box.padding=1.2,
                    segment.color="#90888895")+
    scale_y_continuous(breaks=c(seq(4,16, by=4),10))+
    scale_x_continuous(breaks=seq(200, 2000, by=100))+
    scale_color_manual(values=c("AMD"="#ED1C24", "Nvidia"="#76B900"))+
    labs(title="MSRP - VRAM : 2020-2022 GPU",
         x="MSRP (USD)",
         y="VRAM (GB)",
         color="Brand")

c20GentoScorePlot<-ggplot(c20Sub, aes(x=Generation, y=Score, color=Brand))+
    geom_point()+
    geom_text_repel(aes(label=GPU),
                    size=4,
                    max.overlaps=Inf,
                    box.padding=1.2,
                    segment.color="#90888895")+
    geom_smooth(method="lm", se=FALSE, aes(group=Brand))+
    scale_y_continuous(breaks=seq(0, 8000, by=500))+
    labs(title="Generation - Score : 2020-2022 GPU",
         x="Generation",
         y="Score",
         color="Brand")

c20GentoFP16 <- ggplot(c20Sub, aes(x=Generation, y=FP16, color=Brand))+
    geom_point()+
    geom_text_repel(aes(label=GPU),
                    size=4,
                    max.overlaps=Inf,
                    box.padding=1.2,
                    segment.color="#90888895")+
    geom_smooth(method="lm", se=FALSE, aes(group=Brand))+
    scale_y_continuous(breaks=seq(0, 120, by=5))+
    labs(title="Generation - FP16 : 2020-2022 GPU",
         x="Generation",
         y="FP16 (TFLOPS)",
         color="Brand")

c20GentoTDP <- ggplot(c20Sub, aes(x=Generation, y=TDP, color=Brand))+
    geom_point()+
    geom_text_repel(aes(label=GPU),
                    size=4,
                    max.overlaps=Inf,
                    box.padding=1.2,
                    segment.color="#90888895")+
    geom_smooth(method="lm", se=FALSE, aes(group=Brand))+
    scale_y_continuous(breaks=seq(0, 1000, by=25))+
    labs(title="Generation - TDP : 2020-2022 GPU",
         x="Generation",
         y="TDP (W)",
         color="Brand")

c20GentoVRAM <- ggplot(c20Sub, aes(x=Generation, y=VRAM, color=Brand))+
    geom_point()+
    geom_text_repel(aes(label=GPU),
                    size=4,
                    max.overlaps=Inf,
                    box.padding=1.2,
                    segment.color="#90888895")+
    scale_y_continuous(breaks=c(seq(4,16, by=4),10))+
    labs(title="Generation - VRAM : 2020-2022 GPU",
         x="Generation",
         y="VRAM (GB)",
         color="Brand")
    
c20GentoTransistors <- ggplot(c20Sub, aes(x=Generation, y=Transistors, color=Brand))+
    geom_point()+
    geom_text_repel(aes(label=GPU),
                    size=4,
                    max.overlaps=Inf,
                    box.padding=1.2,
                    segment.color="#90888895")+
    scale_y_continuous(breaks = seq(0,200, by=10)) +    
    labs(title="Generation - Transistors : 2020-2022 GPU",
         x="Generation",
         y="Transistors (B)",
         color="Brand")

c20GentoConfig <- ggplot(c20Sub, aes(x=Generation, y=Config, color=Brand))+
    geom_point()+
    geom_text_repel(aes(label=GPU),
                    size=4,
                    max.overlaps=Inf,
                    box.padding=1.2,
                    segment.color="#90888895")+
    labs(title="Generation - Config : 2020-2022 GPU",
         x="Generation",
         y="Config",
         color="Brand")



ggsave("plot\\Universal\\2020-2022GPU\\2020-2022ScorePlot.png", c20ScorePlot, width=10, height=12)
ggsave("plot\\Universal\\2020-2022GPU\\2020-2022VRAMPlot.png", c20VRAMPlot, width=10, height=12)
ggsave("plot\\Universal\\2020-2022GPU\\2020-2022GentoScorePlot.png", c20GentoScorePlot, width=10, height=12)
ggsave("plot\\Universal\\2020-2022GPU\\2020-2022GentoFP16.png", c20GentoFP16, width=10, height=12)
ggsave("plot\\Universal\\2020-2022GPU\\2020-2022GentoTDP.png", c20GentoTDP, width=10, height=12)
ggsave("plot\\Universal\\2020-2022GPU\\2020-2022GentoVRAM.png", c20GentoVRAM, width=10, height=12)
ggsave("plot\\Universal\\2020-2022GPU\\2020-2022GentoTransistors.png", c20GentoTransistors, width=10, height=12)
ggsave("plot\\Universal\\2020-2022GPU\\2020-2022GentoConfig.png", c20GentoConfig, width=10, height=12)


print("2020-2022GPU Complete")
print("Plots Saved to plot\\Universal\\2020-2022GPU")

#2018-2019GPU
nv20sub<-subset(df.nvidia, Generation == "20")
amd5000sub<-subset(df.amd, Generation == "5000")

if(nrow(nv20sub) > 0){
    nv20sub$Brand <- "Nvidia"
} else {
    nv20sub$Brand <- character(0)
}
if(nrow(amd5000sub) > 0){
    amd5000sub$Brand <- "AMD"
} else {
    amd5000sub$Brand <- character(0)
}

c18Sub<-rbind(nv20sub, amd5000sub)
c18ScorePlot<-ggplot(c18Sub, aes(x=MSRP, y=Score, color=Brand))+
    geom_point()+
    geom_text_repel(aes(label=GPU),
                    size=4,
                    max.overlaps=Inf,
                    box.padding=1.2,
                    segment.color="#90888895")+
    geom_smooth(method="lm", se=FALSE, aes(group=Brand))+
    scale_x_continuous(breaks=seq(200, 2500, by=100))+
    scale_y_continuous(breaks=seq(0, 6000, by=250))+
    scale_color_manual(values=c("AMD"="#ED1C24", "Nvidia"="#76B900"))+
    labs(title="MSRP - Score : 2018-2019 GPU",
        x="MSRP (USD)",
        y="Score",
        color="Brand")

c18VRAMPlot<-ggplot(c18Sub, aes(x=MSRP, y=VRAM, color=Brand))+
    geom_point()+
    geom_text_repel(aes(label=GPU),
                    size=4,
                    max.overlaps=Inf,
                    box.padding=1.2,
                    segment.color="#90888895")+
    scale_y_continuous(breaks=c(seq(4, 8, by=2),11))+
    scale_x_continuous(breaks=seq(200, 2500, by=100))+
    scale_color_manual(values=c("AMD"="#ED1C24", "Nvidia"="#76B900"))+
    labs(title="MSRP - VRAM : 2018-2019 GPU",
        x="MSRP (USD)",
        y="VRAM (GB)",
        color="Brand")

c18GentoScorePlot<-ggplot(c18Sub, aes(x=Generation, y=Score, color=Brand))+
    geom_point()+
    geom_text_repel(aes(label=GPU),
                    size=4,
                    max.overlaps=Inf,
                    box.padding=1.2,
                    segment.color="#90888895")+
    geom_smooth(method="lm", se=FALSE, aes(group=Brand))+
    scale_y_continuous(breaks=seq(0, 6000, by=250))+
    labs(title="Generation - Score : 2018-2019 GPU",
        x="Generation",
        y="Score",
        color="Brand")

c18GentoFP16 <- ggplot(c18Sub, aes(x=Generation, y=FP16, color=Brand))+
    geom_point()+
    geom_text_repel(aes(label=GPU),
                    size=4,
                    max.overlaps=Inf,
                    box.padding=1.2,
                    segment.color="#90888895")+
    geom_smooth(method="lm", se=FALSE, aes(group=Brand))+
    scale_y_continuous(breaks=seq(0, 120, by=5))+
    labs(title="Generation - FP16 : 2018-2019 GPU",
        x="Generation",
        y="FP16 (TFLOPS)",
        color="Brand")

c18GentoTDP <- ggplot(c18Sub, aes(x=Generation, y=TDP, color=Brand))+
    geom_point()+
    geom_text_repel(aes(label=GPU),
                    size=4,
                    max.overlaps=Inf,
                    box.padding=1.2,
                    segment.color="#90888895")+
    geom_smooth(method="lm", se=FALSE, aes(group=Brand))+
    scale_y_continuous(breaks=seq(0, 1000, by=25))+
    labs(title="Generation - TDP : 2018-2019 GPU",
        x="Generation",
        y="TDP (W)",
        color="Brand")

c18GentoVRAM <- ggplot(c18Sub, aes(x=Generation, y=VRAM, color=Brand))+
    geom_point()+
    geom_text_repel(aes(label=GPU),
                    size=4,
                    max.overlaps=Inf,
                    box.padding=1.2,
                    segment.color="#90888895")+
    scale_y_continuous(breaks=c(seq(4, 8, by=2),11))+
    labs(title="Generation - VRAM : 2018-2019 GPU",
        x="Generation",
        y="VRAM (GB)",
        color="Brand")

c18GentoTransistors <- ggplot(c18Sub, aes(x=Generation, y=Transistors, color=Brand))+
    geom_point()+
    geom_text_repel(aes(label=GPU),
                    size=4,
                    max.overlaps=Inf,
                    box.padding=1.2,
                    segment.color="#90888895")+
    labs(title="Generation - Transistors : 2018-2019 GPU",
        x="Generation",
        y="Transistors (B)",
        color="Brand")

c18GentoConfig <- ggplot(c18Sub, aes(x=Generation, y=Config, color=Brand))+
    geom_point()+
    geom_text_repel(aes(label=GPU),
                    size=4,
                    max.overlaps=Inf,
                    box.padding=1.2,
                    segment.color="#90888895")+
    labs(title="Generation - Config : 2018-2019 GPU",
        x="Generation",
        y="Config",
        color="Brand")


ggsave("plot\\Universal\\2018-2019GPU\\2018-2019ScorePlot.png", c18ScorePlot, width=10, height=12)
ggsave("plot\\Universal\\2018-2019GPU\\2018-2019VRAMPlot.png", c18VRAMPlot, width=10, height=12)
ggsave("plot\\Universal\\2018-2019GPU\\2018-2019GentoScorePlot.png", c18GentoScorePlot, width=10, height=12)
ggsave("plot\\Universal\\2018-2019GPU\\2018-2019GentoFP16.png", c18GentoFP16, width=10, height=12)
ggsave("plot\\Universal\\2018-2019GPU\\2018-2019GentoTDP.png", c18GentoTDP, width=10, height=12)
ggsave("plot\\Universal\\2018-2019GPU\\2018-2019GentoVRAM.png", c18GentoVRAM, width=10, height=12)
ggsave("plot\\Universal\\2018-2019GPU\\2018-2019GentoTransistors.png", c18GentoTransistors, width=10, height=12)
ggsave("plot\\Universal\\2018-2019GPU\\2018-2019GentoConfig.png", c18GentoConfig, width=10, height=12)


print("2018-2019GPU Complete")
print("Plots Saved to plot\\Universal\\2018-2019GPU")

#AllGPU
print("AllGPU Start")
allSub<-rbind(nv50sub, amd9000sub, intelBsub, nv40sub, amd7000sub, intelAsub, nv30sub, amd6000sub, nv20sub, amd5000sub)
allScorePlot<-ggplot(allSub, aes(x=MSRP, y=Score, color=Generation))+
    geom_point()+
    geom_text_repel(aes(label=GPU),
                    size=3,
                    max.overlaps=Inf,
                    box.padding=1.35,
                    force=1.8,
                    segment.color="#90888895")+
    geom_smooth(method="lm", se=FALSE, linewidth = 0.5, aes(group=Generation))+
    scale_x_continuous(breaks=seq(200, 2500, by=100))+
    scale_y_continuous(breaks=seq(0, 14000, by=500))+
    scale_color_manual(values=c("9000"="#ED1C24","7000"="#ED1C24","6000"="#ED1C24","5000"="#ED1C24", 
                                "B"="#0071C5","A"="#0071C5",
                                "50"="#76B900","40"="#76B900","30"="#76B900","20"="#76B900"))+
    labs(title="MSRP - Score : All GPU",
         x="MSRP (USD)",
         y="Score",
         color="Generation")

allVRAMPlot<-ggplot(allSub, aes(x=MSRP, y=VRAM, color=Generation))+
    
    geom_point()+
    geom_text_repel(aes(label=GPU),
                    size=3,
                    max.overlaps=Inf,
                    box.padding=1.35,
                    force=1.8,
                    segment.color="#90888895")+
    scale_y_continuous(breaks=c(seq(4, 12, by=2),11,16,20,24,32))+
    scale_x_continuous(breaks=seq(200, 2500, by=100))+
    scale_color_manual(values=c("9000"="#ED1C24","7000"="#ED1C24","6000"="#ED1C24","5000"="#ED1C24", 
                                "B"="#0071C5","A"="#0071C5",
                                "50"="#76B900","40"="#76B900","30"="#76B900","20"="#76B900"))+
    labs(title="MSRP - VRAM : All GPU",
         x="MSRP (USD)",
         y="VRAM (GB)",
         color="Generation")         

allGentoScorePlot<-ggplot(allSub, aes(x=Generation, y=Score, color=Generation))+
    geom_point()+
    geom_text_repel(aes(label=GPU),
                    size=3,
                    max.overlaps=Inf,
                    box.padding=1.35,
                    force=1.8,
                    segment.color="#90888895")+
    geom_smooth(method="lm", se=FALSE, linewidth = 0.5, aes(group=Generation))+
    scale_y_continuous(breaks=seq(0, 14000, by=500))+
    labs(title="Generation - Score : All GPU",
         x="Generation",
         y="Score",
         color="Generation")

allGentoFP16 <- ggplot(allSub, aes(x=Generation, y=FP16, color=Generation))+
    geom_point()+
    geom_text_repel(aes(label=GPU),
                    size=3,
                    max.overlaps=Inf,
                    box.padding=1.35,
                    force=1.8,
                    segment.color="#90888895")+
    geom_smooth(method="lm", se=FALSE, linewidth = 0.5, aes(group=Generation))+
    scale_y_continuous(breaks=seq(0, 120, by=5))+
    labs(title="Generation - FP16 : All GPU",
         x="Generation",
         y="FP16 (TFLOPS)",
         color="Generation")

allGentoTDP <- ggplot(allSub, aes(x=Generation, y=TDP, color=Generation))+
    geom_point()+
    geom_text_repel(aes(label=GPU),
                    size=3,
                    max.overlaps=Inf,
                    box.padding=1.35,
                    force=1.8,
                    segment.color="#90888895")+
    geom_smooth(method="lm", se=FALSE, linewidth = 0.5, aes(group=Generation))+
    scale_y_continuous(breaks=seq(0, 1000, by=25))+
    labs(title="Generation - TDP : All GPU",
         x="Generation",
         y="TDP (W)",
         color="Generation")

allGentoVRAM <- ggplot(allSub, aes(x=Generation, y=VRAM, color=Generation))+
    geom_point()+
    geom_text_repel(aes(label=GPU),
                    size=3,
                    max.overlaps=Inf,
                    box.padding=1.35,
                    force=1.8,
                    segment.color="#90888895")+
    scale_y_continuous(breaks=c(seq(4, 12, by=2),11,16,20,24,32))+
    labs(title="Generation - VRAM : All GPU",
         x="Generation",
         y="VRAM (GB)",
         color="Generation")

allGentoTransistors <- ggplot(allSub, aes(x=Generation, y=Transistors, color=Generation))+
    geom_point()+
    geom_text_repel(aes(label=GPU),
                    size=3,
                    max.overlaps=Inf,
                    box.padding=1.35,
                    force=1.8,
                    segment.color="#90888895")+
    scale_y_continuous(breaks = seq(0,200, by=5)) +
    labs(title="Generation - Transistors : All GPU",
         x="Generation",
         y="Transistors (B)",
         color="Generation")

allGentoConfig <- ggplot(allSub, aes(x=Generation, y=Config, color=Generation))+
    geom_point()+
    geom_text_repel(aes(label=GPU),
                    size=3,
                    max.overlaps=Inf,
                    box.padding=1.35,
                    force=1.8,
                    segment.color="#90888895")+
    labs(title="Generation - Config : All GPU",
         x="Generation",
         y="Config",
         color="Generation")

ggsave("plot\\Universal\\AllGPU\\AllScorePlot.png", allScorePlot, width=10, height=12)
ggsave("plot\\Universal\\AllGPU\\AllVRAMPlot.png", allVRAMPlot, width=10, height=12)
ggsave("plot\\Universal\\AllGPU\\AllGentoScorePlot.png", allGentoScorePlot, width=10, height=12)
ggsave("plot\\Universal\\AllGPU\\AllGentoFP16.png", allGentoFP16, width=10, height=12)
ggsave("plot\\Universal\\AllGPU\\AllGentoTDP.png", allGentoTDP, width=10, height=12)
ggsave("plot\\Universal\\AllGPU\\AllGentoVRAM.png", allGentoVRAM, width=10, height=12)
ggsave("plot\\Universal\\AllGPU\\AllGentoTransistors.png", allGentoTransistors, width=10, height=12)
ggsave("plot\\Universal\\AllGPU\\AllGentoConfig.png", allGentoConfig, width=10, height=12)

print("AllGPU Complete")
print("Plots Saved to plot\\Universal\\AllGPU")

print("Brand Comparisons Complete")

print("All Plots Complete")










