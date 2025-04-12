import React from "react";
import { Container, Typography } from "@mui/material";
import BusTable from "./assets/components/BusTable";

function App() {
  return (
    <>
      <div className="fondo-transparente" /> {/* Capa negra */}
      <Container sx={{ mt: 4, position: "relative", zIndex: 10 }} id="tabla">
        <Typography variant="h3" gutterBottom color="#000">
          Gestión de Buses
        </Typography>
        <BusTable />
      </Container>
    </>
  );
}

export default App;
