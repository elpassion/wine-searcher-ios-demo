brew help &>/dev/null

if [ $? -ne 0 ]; then
   echo "Installing Homebrew"
   /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

SWIFTLINT=`brew leaves | grep "swiftlint"`

if [ -z "$SWIFTLINT" ]; then
   echo "Installing swiftlint"
   brew install swiftlint
fi

echo "Setup completed"
