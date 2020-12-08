# Python snippets

## List comprehension

```python
# TODO
```

## Pandas DataFrame

#### Convert DataFrame to dict

```python
>>> df = pd.DataFrame(
...     {
...         "key": [10, 20, 30, 40],
...         "value": ["foo", "bar", "baz", "qux"]
...         }
... )
>>> 
>>> dict_ = dict(zip(df.key, df.value))
>>>
>>> dict_
{10: 'foo', 20: 'bar', 30: 'baz', 40: 'qux'}
```


