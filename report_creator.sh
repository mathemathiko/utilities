TODAY=`date '+%F'`
if [ -e $TODAY.md ] ; then
  echo "exist $TODAY.md."
else
  cp template.md $TODAY.md
  echo "create $TODAY.md."
fi

THIS_MONTH=`date +%Y_%m`
if [ -e $THIS_MONTH ] ; then
  echo "exist $THIS_MONTH."
else
  mkdir $THIS_MONTH
  echo "create $THIS_MONTH."
fi

YESTERDAY=`date -v-1d '+%F'`
if [ -e $YESTERDAY.md ] ; then
  mv $YESTERDAY.md $THIS_MONTH/
  echo "move $YESTERDAY.md."
fi

THREE_DAYS_BEFORE=`date -v-3d '+%F'`
if [ -e $THREE_DAYS_BEFORE.md ] ; then
  mv $THREE_DAYS_BEFORE.md $THIS_MONTH/
  echo "move $THREE_DAYS_BEFORE.md."
fi
