#!/bin/bash
# filepath: /Users/ameyassh/Documents/PhD/Research/Slug ID/SlugID/setup_service.sh
echo -e "\e[1;31mbox_imaging service runs on startup. This takes the camera and records video indefinitely.\e[0m" >> ~/.bashrc
CURRENT_USER=$(whoami)

# Generate service file with current user
cat > box_imaging.service << EOF
[Unit]
Description=Start Image capture
After=multi-user.target

[Service]
Type=oneshot
User=$CURRENT_USER
Group=$CURRENT_USER
WorkingDirectory=/home/$CURRENT_USER/SlugBoxImaging
ExecStart=/home/$CURRENT_USER/SlugBoxImaging/start_stream.sh
RemainAfterExit=yes
StandardOutput=journal
StandardError=journal

[Install]
WantedBy=multi-user.target
EOF

# Install the service
sudo cp box_imaging.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable box_imaging.service

echo "Service installed for user: $CURRENT_USER"
