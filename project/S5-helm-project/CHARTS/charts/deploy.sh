# Deploy assets chart
helm upgrade --install assets ./assets

#!/bin/bash 
# Deploy carts chart
helm upgrade --install carts ./carts

# Deploy catalog chart
helm upgrade --install catalog ./catalog

# Deploy checkout chart
helm upgrade --install checkout ./checkout

# Deploy orders chart
helm upgrade --install orders ./orders

# Deploy UI chart
helm upgrade --install ui ./ui
