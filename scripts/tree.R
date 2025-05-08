setwd("C:/Users/Paulina/Documents/Phylogenics tree/")

# Cargar librerías
library(ggtree)
library(ggplot2)
library(treeio)

# 1. Cargar el árbol y metadatos
tree <- read.iqtree("C:/Users/Paulina/Documents/Phylogenics tree/16S_phylogeny.contree")

# 2. Extraer modelo evolutivo del archivo .log (alternativa)
log_file <- sub(".contree", ".log", "C:/Users/Paulina/Documents/Phylogenics tree/16S_phylogeny.contree")
log_content <- readLines(log_file)
model <- gsub(".*Best-fit model: ", "", grep("Best-fit model:", log_content, value = TRUE)[1])

# 3. Crear visualización
p <- ggtree(tree, layout = "rectangular", branch.length = "branch.length") +
  
  # Ramas del árbol
  geom_tree(linewidth = 0.8, color = "darkgray") +
  
  # Etiquetas de las puntas (nombres de secuencias)
  geom_tiplab(
    aes(label = gsub("_", " ", label)),  # Reemplaza _ por espacios
    size = 3,
    color = "darkblue",
    align = TRUE,
    offset = 0.005,
    fontface = "italic"
  ) +
  
  # Soporte estadístico (solo valores ≥70)
  geom_nodelab(
    aes(label = ifelse(UFboot >= 70, paste0("UFboot=", UFboot), "")),
    size = 3,
    color = "red",
    hjust = 1.1,
    vjust = -0.3,
    geom = "text"
  ) +
  
  # Escala de distancia evolutiva
  geom_treescale(
    x = 0.1,
    y = -3,
    width = 0.1,  # Longitud de la barra de escala
    color = "black",
    fontsize = 4
  ) +
  
  # Título y estilo
  labs(
    title = "Árbol Filogenético de 16S rRNA",
    subtitle = paste("Modelo:", model),
    caption = paste("Número de secuencias:", length(tree@phylo$tip.label))
  ) +
  theme_tree2() +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold"),
    plot.subtitle = element_text(hjust = 0.5)
  )

# 4. Mostrar en RStudio (pestaña Plots)
print(p)

# 5. Guardar en alta calidad (opcional)
ggsave("results/16S_tree_ggtree.png", plot = p, width = 12, height = 10, dpi = 300)