"""RandomForest Classification"""
from numpy import mean
from numpy import std
from sklearn.datasets import make_classification
from sklearn.model_selection import cross_val_score
from sklearn.model_selection import RepeatedStratifiedKFold
from sklearn.ensemble import RandomForestClassifier
from sklearn.ensemble import RandomForestClassifier
#sesis_data = pandasdataframe: sesis und zugehörige features in 2 spalten!
X, y = sesis_data(n_samples=1000, n_features=20, n_informative=15, n_redundant=5, random_state=3)
print(X.shape, y.shape)

#features sollten standardabweichung und mittelwert sein, eventuell noch weitere
#eventuell als for schleife um eine liste der means usw ins dataframe zu stellen
std= np.std(sesis)
mean= np.mean(np.where(sesis!=0))
path="bla"
X= pd.read_csv(path+"data_sesis.csv")
model= RandomForestClassifier()
#evaluate model
cv= RepeatedStratifiedKFold(n_splits=10, n_repeats=3, random_state=1)
n_scores=cross_val_score(model, X, y, scoring="accuracy", cv=cv, n_jobs=-1, error_score='raise')