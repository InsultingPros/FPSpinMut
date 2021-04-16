class NewAvoidMarker extends FleshPoundAvoidArea;


// set KFMonst to owner
function PreBeginPlay()
{
  super.PreBeginPlay();
  InitFor(KFMonster(owner));
  SetTimer(5.0,true);
}


// set a timer to destroy our actor after zed death
function Timer()
{
  super.Timer();
  if (KFMonst == none)
    Destroy();
}


// added KFMonsterController check
function Touch(actor Other)
{
  if ((Pawn(Other) != none) && KFMonsterController(Pawn(Other).Controller) != none && RelevantTo(Pawn(Other)))
    KFMonsterController(Pawn(Other).Controller).AvoidThisMonster(KFMonst);
}


// added health check, 1500 is FP's base health
function bool RelevantTo(Pawn P)
{
  local KFMonster M;

  M = KFMonster(p);
  if (M != none && M.default.Health >= 1500)
    return false;

  return ( KFMonst != none && VSizeSquared(KFMonst.Velocity) >= 75 && Super.RelevantTo(P)
     && KFMonst.Velocity dot (P.Location - KFMonst.Location) > 0  );
}


defaultproperties{}