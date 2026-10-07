# 19 - HR Analytics

## Obiettivo

Applicare SQL all'analisi dei dati delle risorse umane.

## Scenario

Il database HR Analytics utilizza tabelle come:
- Departments;
- Employees;
- Attendance;
- Promotions.

## Esempio

Numero di dipendenti per dipartimento:

```sql
SELECT
    DepartmentId,
    COUNT(*) AS NumeroDipendenti
FROM Employees
GROUP BY DepartmentId;
```

## Analisi possibili

- distribuzione dei dipendenti;
- assenze;
- presenze;
- promozioni;
- confronti tra dipartimenti;
- indicatori HR;
- dati pronti per dashboard.
