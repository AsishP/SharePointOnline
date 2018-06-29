//Check the gist code - https://gist.github.com/AsishP/b817455ce58b753e4f02ae5a0482e7a4 for filling the NavIds Array
foreach (int id in navIds)
{
    NavigationNode nodeToDelete = web.Navigation.GetNodeById(id);
    contextAsset.Load(nodeToDelete);
    contextAsset.ExecuteQuery();
    nodeToDelete.DeleteObject();
    contextAsset.ExecuteQuery();
}