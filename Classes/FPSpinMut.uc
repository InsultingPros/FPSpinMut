class FPSpinMut extends Mutator;


function bool CheckReplacement(Actor Other, out byte bSuperRelevant)
{
  // FP is spawned at this moment, we catch
  // the bugged Avoid Marker it spawns later
  if (Other.Class.Name == 'FleshpoundAvoidArea')
  {
    // and replace it with out fixed Marker
    ReplaceWith(Other,"FPSpinMut.NewAvoidMarker");
    return false;
  }
  return super.CheckReplacement(Other,bSuperRelevant);
}


defaultproperties
{
  GroupName="KF-QOLMutators"
  FriendlyName="FPSpinMut"
  Description="Removes fucking FP spins when they start to rage while touching each other."
}