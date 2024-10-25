import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import { Header } from "./ui/containers/Header";
import { ThemeProvider } from "./ui/elements/theme-provider";
import { Toaster } from "./ui/elements/sonner";
import { Overlay } from "./ui/modules/Overlay";

function Core() {
  return (
    <div id="app" className="flex flex-col items-center gap-8">
      <ThemeProvider defaultTheme="dark" storageKey="vite-ui-theme">
        <Header />
        <Overlay />
      </ThemeProvider>
    </div>
  );
}

function App() {
  return (
    <Router>
      <Routes>
        <Route path="/" element={<Core />} />
      </Routes>
      <Toaster position="top-center" />
    </Router>
  );
}

export default App;
