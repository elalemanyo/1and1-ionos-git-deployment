#!/bin/sh
if [ $(git rev-parse --is-bare-repository) = true ]
then
  REPOSITORY_BASENAME=$(basename "$PWD")
else
  REPOSITORY_BASENAME=$(basename $(readlink -nf "$PWD"/..))
fi

REPOSITORY_BASENAME=$(basename "$PWD")
REPOSITORY_BASENAME=${REPOSITORY_BASENAME%.git}

echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "!!!!!         Starting post-receive actions for ${REPOSITORY_BASENAME} repo         !!!!!!!!!!!!!"

while read oldrev newrev ref
  do
  branch=`echo $ref | cut -d/ -f3`
  folder="${branch}"

  FINAL="${HOME}/www/${REPOSITORY_BASENAME}/${folder}"
  mkdir -p ${FINAL}
  git --work-tree=${FINAL} checkout -f $branch
done
echo "!!!!!         $branch branch from ${REPOSITORY_BASENAME} repo has been updated.      !!!!!!!!!!!!!"
echo "!!!!!                                   DONE                                         !!!!!!!!!!!!!"
