#!/bin/bash
rm /tmp/m_surfaces
LayerManagerControl get surfaces >> /tmp/m_surfaces
mx=$(grep -Eo '[0-9]+' /tmp/m_surfaces | awk '$0>x{x=$0};END{print x}')
echo $mx
LayerManagerControl set layer 100 render order $mx
LayerManagerControl set surface $mx visibility 1 
