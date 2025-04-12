import React, { useState, useEffect } from "react";
import {
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TableRow,
  Paper,
  Typography,
  TextField,
  Button,
  Stack,
  TablePagination,
} from "@mui/material";

const BusTable = () => {
  const [buses, setBuses] = useState([]);
  const [error, setError] = useState(null);
  const [busId, setBusId] = useState("");
  const [filteredBus, setFilteredBus] = useState(null);
  const [page, setPage] = useState(0);
  const [rowsPerPage, setRowsPerPage] = useState(8);

  useEffect(() => {
    fetch("http://localhost:8080/bus")
      .then((res) => {
        if (!res.ok) throw new Error("Error al obtener buses");
        return res.json();
      })
      .then(setBuses)
      .catch((err) => setError(err.message));
  }, []);

  const handleBuscar = () => {
    const result = buses.find((b) => b.id === Number(busId));
    setFilteredBus(result || null);
    setPage(0);
  };

  const handleMostrarTodos = () => {
    setBusId("");
    setFilteredBus(null);
    setPage(0);
  };

  const handleChangePage = (event, newPage) => {
    setPage(newPage);
  };

  const handleChangeRowsPerPage = (event) => {
    setRowsPerPage(parseInt(event.target.value, 10));
    setPage(0);
  };

  const displayedBuses = filteredBus
    ? [filteredBus]
    : buses.slice(page * rowsPerPage, page * rowsPerPage + rowsPerPage);

  return (
    <>
      <Stack direction="row" spacing={2} sx={{ mb: 3 }}>
        <TextField
          label="Buscar por ID"
          type="number"
          value={busId}
          onChange={(e) => setBusId(e.target.value)}
          size="small"
          className="textfieldB"
        />

        <Button variant="contained" onClick={handleBuscar} className="btnB">
          Buscar
        </Button>
        <Button onClick={handleMostrarTodos} className="btnMT">
          Mostrar Todos
        </Button>
      </Stack>

      {error && (
        <Typography color="error" sx={{ mb: 2 }}>
          {error}
        </Typography>
      )}

      <TableContainer component={Paper} sx={{ maxHeight: 500 }}>
        <Table stickyHeader>
          <TableHead>
            <TableRow>
              <TableCell>
                <b>ID</b>
              </TableCell>
              <TableCell>
                <b>Número</b>
              </TableCell>
              <TableCell>
                <b>Placa</b>
              </TableCell>
              <TableCell>
                <b>Características</b>
              </TableCell>
              <TableCell>
                <b>Activo</b>
              </TableCell>
              <TableCell>
                <b>Marca</b>
              </TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {displayedBuses.map((bus) => (
              <TableRow key={bus.id}>
                <TableCell>{bus.id}</TableCell>
                <TableCell>{bus.numeroBus}</TableCell>
                <TableCell>{bus.placa}</TableCell>
                <TableCell>{bus.caracteristicas}</TableCell>
                <TableCell>{bus.activo ? "Sí" : "No"}</TableCell>
                <TableCell>{bus.marca?.nombre || "Sin marca"}</TableCell>
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </TableContainer>

      {!filteredBus && (
        <TablePagination
          component="div"
          count={buses.length}
          page={page}
          onPageChange={handleChangePage}
          rowsPerPage={rowsPerPage}
          onRowsPerPageChange={handleChangeRowsPerPage}
          labelRowsPerPage="Filas por página"
        />
      )}
    </>
  );
};

export default BusTable;
